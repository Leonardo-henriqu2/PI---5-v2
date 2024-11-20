import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/form.dart';
import '../main.dart';

class Userscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/wallpaper.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Card para "Meus Carros"
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.directions_car, color: Colors.blue),
                title: Text(
                  'Meus carros',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Visualize e gerencie seus carros'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Ação ao clicar
                  print('Meus carros clicado');
                },
              ),
            ),
            SizedBox(height: 16),
            // Card para "Avaliação"
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text(
                  'Avaliação',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Faça ou veja suas avaliações'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                    // Ação de login (validação, autenticação, etc.)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
