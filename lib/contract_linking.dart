import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
// J'ai supprimé l'import web_socket_channel qui ne sert plus

class ContractLinking extends ChangeNotifier {
  // Configuration pour Chrome/Windows
  final String _rpcUrl = "http://127.0.0.1:7545";
  // J'ai supprimé _wsUrl car on ne l'utilise plus
  
  // VOTRE CLE PRIVEE (Celle de votre code)
  final String _privateKey = "";

  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;
  late Credentials _credentials;
  late DeployedContract _contract;
  late ContractFunction _yourName;
  late ContractFunction _setName;
  String? deployedName;

  ContractLinking() {
    initialSetup();
  }

 Future<void> initialSetup() async {
    // Connexion simplifiée (HTTP uniquement) -> C'est ça qui va accélérer votre app !
    _client = Web3Client(_rpcUrl, Client());
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile = await rootBundle.loadString("assets/HelloWorld.json");
    
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
    
    _contractAddress = EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = EthPrivateKey.fromHex(_privateKey);
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "HelloWorld"), _contractAddress);
    
    _yourName = _contract.function("yourName");
    _setName = _contract.function("setName");
    
    await getName();
  }

  Future<void> getName() async {
    var currentName = await _client.call(
        contract: _contract, function: _yourName, params: []);
    deployedName = currentName[0];
    isLoading = false;
    notifyListeners();
  }

  Future<void> setName(String nameToSet) async {
    isLoading = true;
    notifyListeners();
    
    try {
      await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
          contract: _contract,
          function: _setName,
          parameters: [nameToSet],
          // On augmente la limite de Gas pour être sûr que ça passe
          maxGas: 1000000, 
        ),
        // Important : Ganache utilise souvent l'ID 1337 par défaut pour les transactions
        chainId: 1337, 
      );
      
      // On attend un peu que la blockchain traite la demande
      await Future.delayed(const Duration(seconds: 2));
      
      await getName();
    } catch (e) {
      print("Erreur lors de la transaction : $e");
      isLoading = false;
      notifyListeners();
    }
  }
}