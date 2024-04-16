import 'package:flutter/material.dart';
import 'package:projeto_app_repiracao/main.dart';

class UsageCountScreen extends StatelessWidget {
  const UsageCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contagem de Uso', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Aqui você verá a contagem de dias e vezes que utilizou o app.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
