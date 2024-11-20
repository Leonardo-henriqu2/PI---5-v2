import 'dart:math';
import 'package:flutter/material.dart';

class TelaFinal extends StatelessWidget {
  final String name;

  TelaFinal({required this.name});

  String gerarRespostaAleatoria() {
    final random = Random();
    final respostas = ['acessível', 'não acessível', 'bom', 'muito bom'];
    final indiceAleatorio = random.nextInt(respostas.length);
    return respostas[indiceAleatorio];
  }

  @override
  Widget build(BuildContext context) {
    final respostaAleatoria = gerarRespostaAleatoria(); // Chama a função

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent], // Cores do gradiente
            begin: Alignment.topLeft, // Início do gradiente
            end: Alignment.bottomRight, // Fim do gradiente
          ),
        ),
        child: Center(
          child: Text(
            'Você respondeu todas as perguntas! \n'
            'A avaliação do $name foi considerada como: $respostaAleatoria',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Cor do texto
            ),
          ),
        ),
      ),
    );
  }
}
