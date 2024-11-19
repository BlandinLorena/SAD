import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool check = false;
  final String title = 'SAD';
  final List<String> contents = [
    'Início',
    'Formulário',
    'Cadastro',
  ];
  bool aceitoTermos = false;
  bool _passwordVisible = false;

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
                child: Image.asset(
                  'assets/images/topo.png',
                ),
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 35.0,
              ),
              itemBuilder: (context) {
                List<PopupMenuEntry<String>> items = [];
                for (var i = 0; i < contents.length; i++) {
                  items.add(PopupMenuItem<String>(
                    value: contents[i],
                    child: Text(
                      contents[i],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ));
                  if (i < contents.length - 1) {
                    items.add(const PopupMenuDivider());
                  }
                }
                return items;
              },
              onSelected: (value) {
                switch (value) {
                  case 'Início':
                    Navigator.pushNamed(context, '/');
                    break;
                  case 'Formulário':
                    Navigator.pushNamed(context, 'formul');
                    break;
                  case 'Cadastro':
                    Navigator.pushNamed(context, 'cadastro');
                    break;
                }
              },
              color: const Color.fromARGB(255, 127, 170, 184),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Color.fromARGB(255, 213, 214, 230)),
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 78.4),
            child: Column(
              children: [
                Container(
                  height: 420,
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
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20.0),
                        child: Column(
                          children: [
                            Center(
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "Apelido:",
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 141, 175, 204),
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
                            const SizedBox(height: 20),
                            TextField(
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: "Senha:",
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 141, 175, 204),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                suffixIcon: IconButton(
                                  icon: IconTheme(
                                    data: const IconThemeData(
                                      size: 20.0,
                                    ),
                                    child: Icon(
                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                      color: const Color.fromARGB(255, 240, 251, 255),
                                    ),
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
                              checkColor: const Color.fromARGB(255, 92, 137, 175),
                              side: const BorderSide(color: Color.fromARGB(255, 73, 106, 132)),
                            ),
                            const Text(
                              "Aceito os termos de uso",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Center(
                          child: SizedBox(
                            width: 190,
                            child: ElevatedButton(
                              onPressed: () {
                                print("Botão Enviar pressionado");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 15, 53, 86),
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                elevation: 10,
                              ),
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              print("Botão Login pressionado");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 188, 222, 243),
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
              ],
            ),
          ),
        ),
        //rodapé
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 24, 52, 70),
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
                      throw 'Could not launch $url';
                    }
                  },
                  child: const FaIcon(
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
