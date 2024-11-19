import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum Serie { Primeiro, Segundo, Terceiro }

enum Curso { Info, Meca, Moda }

class Tecnico extends StatefulWidget {
  const Tecnico({super.key});

  @override
  State<Tecnico> createState() => _TecnicoState();
}

class _TecnicoState extends State<Tecnico> {
  final List<String> contents = [
    'Início',
    'Formulário',
    'Cadastro',
  ];
  Serie? serie = Serie.Primeiro;
  Curso? curso = Curso.Info;

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
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              //Comuputador
              return Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 45.0)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth * 0.4,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28.0),
                              color: const Color.fromARGB(255, 181, 204, 219),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 5, 4, 41).withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            'Integrado',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 255, 255, 255),
                                              fontFamily: "Arial Rounded MT Bold",
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constraints) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // Série
                                          Container(
                                            width: constraints.maxWidth * 0.45,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 167, 203, 234),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: DropdownButton<Serie>(
                                                    hint: const Text(
                                                      "Série",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    onChanged: (Serie? newValue) {
                                                      setState(() {
                                                        serie = newValue;
                                                      });
                                                    },
                                                    underline: SizedBox(width: 0),
                                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                                                      return DropdownMenuItem<Serie>(
                                                        value: value,
                                                        child: Text(
                                                          value.toString().split('.').first,
                                                          style: const TextStyle(color: Colors.white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          // Curso
                                          Container(
                                            width: constraints.maxWidth * 0.45,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 167, 203, 234),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: DropdownButton<Curso>(
                                                    hint: const Text(
                                                      "Curso",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    onChanged: (Curso? newValue) {
                                                      setState(() {
                                                        curso = newValue;
                                                      });
                                                    },
                                                    underline: SizedBox.shrink(),
                                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    items: Curso.values.map<DropdownMenuItem<Curso>>((Curso value) {
                                                      return DropdownMenuItem<Curso>(
                                                        value: value,
                                                        child: Text(
                                                          value.toString().split('.').last,
                                                          style: const TextStyle(color: Colors.white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  //Aluno
                                  Center(
                                    child: LayoutBuilder(
                                      builder: (BuildContext context, BoxConstraints constraints) {
                                        return Container(
                                          width: constraints.maxWidth * 0.93,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 167, 203, 234),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: Center(
                                                    child: DropdownButton<Serie>(
                                                      hint: Center(
                                                        child: Text(
                                                          "Selecione o aluno",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                      onChanged: (Serie? newValue) {
                                                        setState(() {
                                                          serie = newValue;
                                                        });
                                                      },
                                                      items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                                                        return DropdownMenuItem<Serie>(
                                                          value: value,
                                                          child: Center(
                                                            child: Text(
                                                              value.toString().split('.').last,
                                                              style: const TextStyle(color: Colors.white),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      underline: Container(),
                                                      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // Relato
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(
                                        child: Container(
                                      height: 115,
                                      width: 535,
                                      padding: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(135, 120, 115, 150).withOpacity(0.5),
                                            offset: const Offset(0, 3),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'Relato',
                                          border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(16.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color.fromARGB(255, 220, 223, 255),
                                        ),
                                        maxLines: 5,
                                      ),
                                    )),
                                  ),
                                  // Enviar
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Serie: $serie, Curso: $curso');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(255, 9, 43, 77),
                                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                                          textStyle: const TextStyle(fontSize: 16.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(22.0),
                                          ),
                                          elevation: 5.0,
                                          shadowColor: const Color.fromARGB(169, 16, 12, 49),
                                        ),
                                        child: const Text(
                                          'Enviar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            if (constraints.maxWidth > 600) {
              //Tablet
              return Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 45.0)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth * 0.7,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28.0),
                              color: const Color.fromARGB(255, 181, 204, 219),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 5, 4, 41).withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            'Integrado',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 255, 255, 255),
                                              fontFamily: "Arial Rounded MT Bold",
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constraints) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // Série
                                          Container(
                                            width: constraints.maxWidth * 0.45,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 167, 203, 234),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: DropdownButton<Serie>(
                                                    hint: const Text(
                                                      "Série",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    onChanged: (Serie? newValue) {
                                                      setState(() {
                                                        serie = newValue;
                                                      });
                                                    },
                                                    underline: SizedBox(width: 0),
                                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                                                      return DropdownMenuItem<Serie>(
                                                        value: value,
                                                        child: Text(
                                                          value.toString().split('.').first,
                                                          style: const TextStyle(color: Colors.white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          // Curso
                                          Container(
                                            width: constraints.maxWidth * 0.45,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 167, 203, 234),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: DropdownButton<Curso>(
                                                    hint: const Text(
                                                      "Curso",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    onChanged: (Curso? newValue) {
                                                      setState(() {
                                                        curso = newValue;
                                                      });
                                                    },
                                                    underline: SizedBox.shrink(),
                                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    items: Curso.values.map<DropdownMenuItem<Curso>>((Curso value) {
                                                      return DropdownMenuItem<Curso>(
                                                        value: value,
                                                        child: Text(
                                                          value.toString().split('.').last,
                                                          style: const TextStyle(color: Colors.white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  //Aluno
                                  Center(
                                    child: LayoutBuilder(
                                      builder: (BuildContext context, BoxConstraints constraints) {
                                        return Container(
                                          width: constraints.maxWidth * 0.93,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 167, 203, 234),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: Center(
                                                    child: DropdownButton<Serie>(
                                                      hint: Center(
                                                        child: Text(
                                                          "Selecione o aluno",
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                      onChanged: (Serie? newValue) {
                                                        setState(() {
                                                          serie = newValue;
                                                        });
                                                      },
                                                      items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                                                        return DropdownMenuItem<Serie>(
                                                          value: value,
                                                          child: Center(
                                                            child: Text(
                                                              value.toString().split('.').last,
                                                              style: const TextStyle(color: Colors.white),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      underline: Container(),
                                                      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // Relato
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(
                                        child: Container(
                                      height: 115,
                                      width: 535,
                                      padding: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(135, 120, 115, 150).withOpacity(0.5),
                                            offset: const Offset(0, 3),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'Relato',
                                          border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(16.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color.fromARGB(255, 220, 223, 255),
                                        ),
                                        maxLines: 5,
                                      ),
                                    )),
                                  ),
                                  // Enviar
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Serie: $serie, Curso: $curso');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(255, 9, 43, 77),
                                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                                          textStyle: const TextStyle(fontSize: 16.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(22.0),
                                          ),
                                          elevation: 5.0,
                                          shadowColor: const Color.fromARGB(169, 16, 12, 49),
                                        ),
                                        child: const Text(
                                          'Enviar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
             else {
              //Celular
              return Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 45.0)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28.0),
                              color: const Color.fromARGB(255, 181, 204, 219),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 5, 4, 41).withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            'Integrado',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 255, 255, 255),
                                              fontFamily: "Arial Rounded MT Bold",
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  // Linha de série e curso
                                  LayoutBuilder(
                                    builder: (BuildContext context, BoxConstraints constraints) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // Série
                                          Container(
                                            width: constraints.maxWidth * 0.4,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 167, 203, 234),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: DropdownButton<Serie>(
                                                    hint: const Text(
                                                      "Série",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    onChanged: (Serie? newValue) {
                                                      setState(() {
                                                        serie = newValue;
                                                      });
                                                    },
                                                    underline: Container(),
                                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                                                      return DropdownMenuItem<Serie>(
                                                        value: value,
                                                        child: Text(
                                                          value.toString().split('.').first,
                                                          style: const TextStyle(color: Colors.white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          // Curso
                                          Container(
                                            width: constraints.maxWidth * 0.4,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 167, 203, 234),
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: Theme.of(context).copyWith(
                                                    iconTheme: const IconThemeData(
                                                      color: Colors.white,
                                                    ),
                                                    canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                  ),
                                                  child: DropdownButton<Curso>(
                                                    hint: const Text(
                                                      "Curso",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    onChanged: (Curso? newValue) {
                                                      setState(() {
                                                        curso = newValue;
                                                      });
                                                    },
                                                    underline: Container(),
                                                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                    items: Curso.values.map<DropdownMenuItem<Curso>>((Curso value) {
                                                      return DropdownMenuItem<Curso>(
                                                        value: value,
                                                        child: Text(
                                                          value.toString().split('.').last,
                                                          style: const TextStyle(color: Colors.white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  //Aluno
                                  Center(
                                    child: LayoutBuilder(
                                      builder: (BuildContext context, BoxConstraints constraints) {
                                        return Container(
                                          width: constraints.maxWidth * 0.83,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 167, 203, 234),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(255, 43, 69, 103).withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Theme(
                                                data: Theme.of(context).copyWith(
                                                  iconTheme: const IconThemeData(
                                                    color: Colors.white,
                                                  ),
                                                  canvasColor: const Color.fromARGB(255, 65, 126, 179),
                                                ),
                                                child: DropdownButton<Serie>(
                                                  hint: const Padding(
                                                    padding: EdgeInsets.only(left: 60.0),
                                                    child: Center(
                                                      child: Text(
                                                        "Selecione o aluno",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  onChanged: (Serie? newValue) {
                                                    setState(() {
                                                      serie = newValue;
                                                    });
                                                  },
                                                  items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                                                    return DropdownMenuItem<Serie>(
                                                      value: value,
                                                      child: Text(
                                                        value.toString().split('.').last,
                                                        style: const TextStyle(color: Colors.white),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  underline: Container(),
                                                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // Relato
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(
                                      child: LayoutBuilder(
                                        builder: (BuildContext context, BoxConstraints constraints) {
                                          return Container(
                                            width: constraints.maxWidth * 0.87,
                                            height: 100,
                                            padding: const EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(135, 120, 115, 150).withOpacity(0.5),
                                                  offset: const Offset(0, 3),
                                                  blurRadius: 10.0,
                                                ),
                                              ],
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Relato',
                                                border: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                ),
                                                filled: true,
                                                fillColor: const Color.fromARGB(255, 220, 223, 255),
                                              ),
                                              maxLines: 5,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  // Enviar
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Serie: $serie, Curso: $curso');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(255, 9, 43, 77),
                                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                                          textStyle: const TextStyle(fontSize: 16.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          elevation: 5.0,
                                          shadowColor: const Color.fromARGB(169, 16, 12, 49),
                                        ),
                                        child: const Text(
                                          'Enviar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
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
