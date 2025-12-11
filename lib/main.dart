import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/contract_linking.dart';
import 'package:hello_world/hello_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContractLinking>(
      create: (_) => ContractLinking(),
      child: MaterialApp(
        title: 'Hello World Dapp',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.cyan[400],
        ),
        home: const HelloUI(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}