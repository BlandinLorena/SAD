import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final String title = 'SAD';
  final List<String> contents = [
    'Início',
    'Formulário',
    'Login',
    'Cadastro'
        'Relatos',
    'Cursos',
  ];
  bool check = false;
  bool _passwordVisible = false;
  String admin = '';

  final TextEditingController _apelidoController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  Future<void> _buscarUsuario() async {
    final String url = 'http://localhost:3000/usuarios'; // Ajuste conforme sua API
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      try {
        final List<dynamic> users = json.decode(response.body);
        final user = users.firstWhere(
          (user) => user['username'] == _apelidoController.text,
          orElse: () => null,
        );

        if (user != null) {
          setState(() {
            admin = user['isAdmin'].toString(); // Armazena o valor de isAdmin
            print("Usuário encontrado: ${user['username']}, isAdmin: $admin");
          });
        } else {
          print("Usuário não encontrado");
        }
      } catch (e) {
        print("Erro ao processar a resposta: $e");
      }
    } else {
      print("Erro ao buscar dados do usuário: ${response.statusCode}");
    }
  }

  Future<void> _cadastrar() async {
    if (_apelidoController.text.isEmpty || _senhaController.text.isEmpty || !check) {
      print("Preencha todos os campos e aceite os termos.");
      return;
    }

    final String url = 'http://localhost:3000/usuarios'; // Substitua pela URL correta
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'username': _apelidoController.text,
        'password': _senhaController.text,
        'isAdmin': 0, // Defina como 1 para admin, se necessário
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      print("Login realizado com sucesso.");
      // Redirecionar para a tela de login, por exemplo
      Navigator.pushReplacementNamed(context, 'cadastro');
    } else {
      print("Erro ao cadastrar usuário. Tente novamente.");
    }
  }

  Future<void> _login() async {
    final String url = 'http://localhost:3000/'; // Verifique se a URL está correta
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'username': _apelidoController.text,
        'password': _senhaController.text,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('sessionId')) {
          final sessionId = data['sessionId'].toString();

          // Salvar o sessionId nas preferências
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('sessionId', sessionId);
          print("SessionId salvo: $sessionId");

          // Buscar os dados do usuário para obter o valor de isAdmin
          await _buscarUsuario(); // Chama a função que busca o 'isAdmin'

          // Agora a variável admin contém o valor de 'isAdmin' do usuário
          print("Valor de isAdmin: $admin");

          // Redireciona para a tela apropriada com base no valor de admin
          if (admin == '1') {
            // Se for admin, redireciona para a tela de cursos
            Navigator.pushReplacementNamed(context, 'cursos');
          } else {
            // Se for um usuário normal, redireciona para o formulário
            Navigator.pushReplacementNamed(context, 'formul');
          }
        } else {
          print("Erro: sessionId não encontrado na resposta.");
        }
      } catch (e) {
        print("Erro ao processar a resposta JSON: $e");
      }
    } else {
      print("Erro ao fazer login: ${response.statusCode}");
      print("Resposta do servidor: ${response.body}");
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 206, 232, 230),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 24, 52, 70),
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              Container(
                height: 180,
                width: 180,
                child: Image.asset('assets/images/topo.png'),
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width > 600 ? 40 : 78),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 450,
                    width: 320,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 62, 77, 96).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: const Color.fromARGB(255, 181, 204, 219),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20, right: 20.0),
                          child: Column(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                                ),
                              ),
                              TextField(
                                controller: _apelidoController,
                                decoration: InputDecoration(
                                  labelText: "Apelido:",
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 141, 175, 204),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: _senhaController,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  labelText: "Senha:",
                                  labelStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 141, 175, 204),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                value: check,
                                onChanged: (bool? value) {
                                  setState(() {
                                    check = value!;
                                  });
                                },
                                activeColor: Colors.white,
                                checkColor: Color.fromARGB(255, 92, 137, 175),
                                side: BorderSide(color: Color.fromARGB(255, 73, 106, 132)),
                              ),
                              Text(
                                "Aceito os termos de uso",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Center(
                            child: SizedBox(
                              width: 190,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  _cadastrar();
                                  /*Navigator.pushReplacementNamed(
                                      context, 'Login');*/
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 15, 53, 86),
                                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                                  elevation: 10,
                                ),
                                child: Text(
                                  'Cadastrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: SizedBox(
                            width: 190,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _login();
                                //Navigator.pushReplacementNamed(context, 'formul');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 188, 222, 243),
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                                elevation: 10,
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 24, 52, 70),
          child: SizedBox(
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    const url = 'https://www.instagram.com/cefetdiv/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Não foi possível abrir $url';
                    }
                  },
                  child: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const url = 'https://www.divinopolis.cefetmg.br/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Não foi possível abrir $url';
                    }
                  },
                  child: Image.asset(
                    'assets/images/cefet.png',
                    width: 60.0,
                    height: 60.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
