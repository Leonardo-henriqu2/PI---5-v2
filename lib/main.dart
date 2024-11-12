import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
        title: Text('Welcome to The Cycle'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/wallpaper.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Ação de login (validação, autenticação, etc.)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    // Ação de login (validação, autenticação, etc.)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroScreen()),
                    );
                  },
                  child: Text('Criar conta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}



class HomeScreen extends StatelessWidget {
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
  @override
  _PerguntaSequencialState createState() => _PerguntaSequencialState();
}

class _PerguntaSequencialState extends State<PerguntaSequencial> {
  List<String> perguntas = [
    'Quantos integrantes compõe sua família ou usaram o carro no dia-a-dia?',
    'Você prefere porta-malas?',
    'O quão o fator segurança no transporte e deslocamento é importante para você?',
    'Qual a quantidade de portas que você prefere no carro?',
    'Custos em relação a futuras manutenções:',
    'Custo de aquisição do carro:'
  ];

  Map<String, List<String>> opcoes = {
    'Quantos integrantes compõe sua família ou usaram o carro no dia-a-dia?': [
      '2',
      '4',
      'mais'
    ],
    'Você prefere porta-malas?': [
      'Pequenos',
      'Médios',
      'Grandes'
    ],
    'O quão o fator segurança no transporte e deslocamento é importante para você?': [
      'Baixo ',
      'Médio',
      'Alto'
    ],
    'Qual a quantidade de portas que você prefere no carro?': [
      '2',
      '3',
      '4',
      '5 ou mais'
    ],
    'Custos em relação a futuras manutenções:': [
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
          MaterialPageRoute(builder: (context) => TelaFinal()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String perguntaAtual = perguntas[indicePerguntaAtual];

    return Scaffold(
      appBar: AppBar(
        title: Text('The Cycle está aprendendo sobre você'),
        backgroundColor: const Color.fromARGB(255, 223, 209, 209),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
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
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
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
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Resposta Selecionada'),
                        content: Text('Você escolheu: $respostaSelecionada'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              proximaPerguntaOuFinalizar(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Enviar Resposta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Nova tela a ser exibida após a última pergunta
class TelaFinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obrigado!'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Você respondeu todas as perguntas!',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  String _nome = '';
  String _email = '';
  String _senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Campo Nome
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nome = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                // Campo Email
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                // Campo Senha

                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma senha';
                    }
                    if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _senha = value!;
                  },
                ),
                SizedBox(height: 20),
                // Botão de Cadastrar
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Cadastro realizado com sucesso!')),
                      );
                      // Aqui você pode adicionar a lógica para enviar os dados a uma API ou banco de dados.
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
