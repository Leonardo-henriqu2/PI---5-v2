

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/outcome.dart';

class Namecar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Boas-Vindas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CarInputScreen(),
    );
  }
}

class CarInputScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modelo do Carro'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/wallpaper2.jpeg'),
                fit: BoxFit.cover)),
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Insira o modelo ou marca:',
              style: TextStyle(fontSize: 18, backgroundColor: (Colors.white)),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Carro',
                 filled: true, // Ativa o preenchimento de fundo
                  fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                if (name.isNotEmpty) {
                  // Navegar para a próxima tela passando o nome
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaFinal(name: name),
                    ),
                  );
                } else {
                  // Mostrar um alerta se o campo estiver vazio
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor, insira um nome válido.')),
                  );
                }
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),),
    );
  }
}