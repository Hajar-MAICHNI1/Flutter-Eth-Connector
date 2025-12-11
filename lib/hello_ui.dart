import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/contract_linking.dart';

class HelloUI extends StatelessWidget {
  const HelloUI({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupération de l'état du contrat via Provider
    var contractLink = Provider.of<ContractLinking>(context);
    TextEditingController yourNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("TP Blockchain"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: contractLink.isLoading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        const Text(
                          "Valeur sur la Blockchain :",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${contractLink.deployedName}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.green),
                        ),
                        const SizedBox(height: 50),
                        TextFormField(
                          controller: yourNameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Entrez votre nom",
                              hintText: "Ex: Hajar",
                              icon: Icon(Icons.person)),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            contractLink.setName(yourNameController.text);
                            yourNameController.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                          ),
                          child: const Text('Envoyer vers Blockchain', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}