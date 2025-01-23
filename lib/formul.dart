import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FormulPage extends StatelessWidget {
  final List<String> contents = ['Início', 'Formulário', 'Relatos'];

  FormulPage({super.key});

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
                "SAD",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
          actions: [
            //Menu
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
                        fontFamily: "Poppins",
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
                  case 'Relatos':
                    Navigator.pushNamed(context, 'relatos');
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'grad');
                        },
                        child: Column(
                          children: [
                            //graduação
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color.fromARGB(255, 129, 180, 205),
                                          const Color.fromARGB(255, 188, 222, 243),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(255, 2, 3, 45).withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    height: MediaQuery.of(context).size.height * 0.25,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  Image.asset(
                                    'assets/images/grad.png',
                                    height: MediaQuery.of(context).size.height * 0.25,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Graduação',
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 12, 49),
                                fontFamily: "Poppins Bold",
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'tecnico');
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  const Color.fromARGB(255, 129, 180, 205),
                                  const Color.fromARGB(255, 188, 222, 243),
                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 6, 3, 42).withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/tecnico.png',
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Integrado',
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 12, 49),
                              fontFamily: "Poppins-Bold",
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //linha2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'noturno');
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    const Color.fromARGB(255, 129, 180, 205),
                                    const Color.fromARGB(255, 188, 222, 243),
                                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(255, 2, 3, 45).withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/images/noturno.png',
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Noturno',
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 12, 49),
                                fontFamily: "Arial Rounded MT Bold",
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'mestrado');
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 129, 180, 205),
                                  const Color.fromARGB(255, 188, 222, 243),
                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 6, 3, 42).withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/mestrado.png',
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Mestrado',
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 12, 49),
                              fontFamily: "Arial Rounded MT Bold",
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
