import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/outcome.dart';
import 'package:flutter_application_1/screens/nameCar.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responda atentamente as questões',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PerguntaSequencial(),
    );
  }
}

class PerguntaSequencial extends StatefulWidget {
  const PerguntaSequencial({super.key});

  @override
  _PerguntaSequencialState createState() => _PerguntaSequencialState();
}

class _PerguntaSequencialState extends State<PerguntaSequencial> {
  List<String> perguntas = [
    'Qual a capacidade máxima de pessoas que seu carro pode transportar?',
    'Tamanho do porta-malas?',
    'Qual o nível de segurança',
    'Quantidade de portas?',
    'Custos em relação as manutenções:',
    'Custo de aquisição do carro:'
  ];

  Map<String, List<String>> opcoes = {
    'Qual a capacidade máxima de pessoas que seu carro pode transportar?': [
      '2',
      '4',
      'mais'
    ],
    'Tamanho do porta-malas?': [
      'Pequenos',
      'Médios',
      'Grandes'
    ],
    'Qual o nível de segurança': [
      'Baixo ',
      'Médio',
      'Alto'
    ],
    'Quantidade de portas?': [
      '5 ou mais',
      '4',
      '3',
      '2'
    ],
    'Custos em relação as manutenções:': [
      'Muito alto',
      'Alto',
      'Médio',
      'Baixo'
    ],
    'Custo de aquisição do carro:': [
      'Muito alto',
      'Alto',
      'Médio',
      'Baixo'
    ]
  };

  int indicePerguntaAtual = 0;
  late String respostaSelecionada;

  @override
  void initState() {
    super.initState();
    respostaSelecionada = opcoes[perguntas[indicePerguntaAtual]]!.first;
  }

  void proximaPerguntaOuFinalizar(BuildContext context) {
    setState(() {
      if (indicePerguntaAtual < perguntas.length - 1) {
        indicePerguntaAtual++;
        respostaSelecionada = opcoes[perguntas[indicePerguntaAtual]]!.first;
      } else {
        // Ao finalizar a última pergunta, navegue para a nova tela
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Namecar()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String perguntaAtual = perguntas[indicePerguntaAtual];

    return Scaffold(
      appBar: AppBar(
        title: const Text('The Cycle está aprendendo sobre você'),
        backgroundColor: const Color.fromARGB(255, 223, 209, 209),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                perguntaAtual,
                style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: opcoes[perguntaAtual]!.map((opcao) {
                  return RadioListTile<String>(
                    title: Text(opcao),
                    value: opcao,
                    groupValue: respostaSelecionada,
                    onChanged: (valor) {
                      setState(() {
                        respostaSelecionada = valor!;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Resposta Selecionada'),
                        content: Text('Você escolheu: $respostaSelecionada'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              proximaPerguntaOuFinalizar(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Enviar Resposta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}