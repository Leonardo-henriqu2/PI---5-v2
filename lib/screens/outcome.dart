// Nova tela a ser exibida após a última pergunta
import 'package:flutter/material.dart';

class TelaFinal extends StatelessWidget {
  const TelaFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obrigado!'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Você respondeu todas as perguntas!',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}