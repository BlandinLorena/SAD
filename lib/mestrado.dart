import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum Serie { Primeiro, Segundo, Terceiro }

enum Curso { Info, Meca, Moda }

class Mestrado extends StatefulWidget {
  const Mestrado({super.key});

  @override
  State<Mestrado> createState() => _MestradoState();
}

class _MestradoState extends State<Mestrado> {
  final List<String> contents = [
    'Início',
    'Formulário',
    'Relatos',
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              //PC
              return Row(
                children: [
                  //Esquerdo
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/sad.png',
                            width: 500,
                            height: 489,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  // Linha Divisória
                  Container(
                    width: 1,
                    height: MediaQuery.of(context).size.height * 0.6,
                    color: Colors.grey,
                  ),
                  // Direito
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'Mestrado',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 3, 14, 37),
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          //Curso
                          Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 26, 26)),
                                canvasColor: const Color.fromARGB(255, 166, 171, 176),
                              ),
                              child: DropdownButton<Curso>(
                                hint: const Text(
                                  "Selecione o curso",
                                  style: TextStyle(color: Color.fromARGB(255, 23, 23, 23)),
                                ),
                                onChanged: (Curso? newValue) {
                                  setState(() {
                                    curso = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(
                                  height: 1,
                                  color: const Color.fromARGB(255, 16, 16, 16),
                                ),
                                icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 25, 25, 25)),
                                items: Curso.values.map<DropdownMenuItem<Curso>>((Curso value) {
                                  return DropdownMenuItem<Curso>(
                                    value: value,
                                    child: Text(
                                      value.toString().split('.').last,
                                      style: const TextStyle(color: Color.fromARGB(255, 255, 253, 253)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          //Aluno
                          Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                iconTheme: const IconThemeData(color: Color.fromARGB(255, 25, 25, 25)),
                                canvasColor: const Color.fromARGB(255, 166, 171, 176),
                              ),
                              child: DropdownButton<Serie>(
                                hint: const Text(
                                  "Selecione o aluno",
                                  style: TextStyle(color: Color.fromARGB(255, 25, 25, 25)),
                                ),
                                onChanged: (Serie? newValue) {
                                  setState(() {
                                    serie = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(
                                  height: 1,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 0, 0, 0)),
                                items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                                  return DropdownMenuItem<Serie>(
                                    value: value,
                                    child: Text(
                                      value.toString().split('.').last,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Relato
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            width: 600,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                width: 1.0,
                              ),
                              /*boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(135, 120, 115, 150).withOpacity(0.5),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                  ),
                                ],*/
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Relato',
                                border: InputBorder.none,
                                filled: false,
                              ),
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(height: 20),
                          //BotãoEnviar
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Serie: $serie, Curso: $curso');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 9, 43, 77),
                                padding: const EdgeInsets.symmetric(horizontal: 85.0, vertical: 20.0),
                                textStyle: TextStyle(fontSize: 15.5),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
                                elevation: 5.0,
                                shadowColor: const Color.fromARGB(169, 16, 12, 49),
                              ),
                              child: const Text(
                                'Enviar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              //Celular
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Mestrado',
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 14, 37),
                              fontFamily: "Poppins-Bold",
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Curso
                    Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 26, 26)),
                          canvasColor: const Color.fromARGB(255, 166, 171, 176),
                        ),
                        child: DropdownButton<Curso>(
                          hint: const Text(
                            "Selecione o curso",
                            style: TextStyle(color: Color.fromARGB(255, 23, 23, 23)),
                          ),
                          onChanged: (Curso? newValue) {
                            setState(() {
                              curso = newValue;
                            });
                          },
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: const Color.fromARGB(255, 16, 16, 16),
                          ),
                          icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 25, 25, 25)),
                          items: Curso.values.map<DropdownMenuItem<Curso>>((Curso value) {
                            return DropdownMenuItem<Curso>(
                              value: value,
                              child: Text(
                                value.toString().split('.').last,
                                style: const TextStyle(color: Color.fromARGB(255, 255, 253, 253)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Aluno
                    Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          iconTheme: const IconThemeData(color: Color.fromARGB(255, 25, 25, 25)),
                          canvasColor: const Color.fromARGB(255, 166, 171, 176),
                        ),
                        child: DropdownButton<Serie>(
                          hint: const Text(
                            "Selecione o aluno",
                            style: TextStyle(color: Color.fromARGB(255, 25, 25, 25)),
                          ),
                          onChanged: (Serie? newValue) {
                            setState(() {
                              serie = newValue;
                            });
                          },
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 0, 0, 0)),
                          items: Serie.values.map<DropdownMenuItem<Serie>>((Serie value) {
                            return DropdownMenuItem<Serie>(
                              value: value,
                              child: Text(
                                value.toString().split('.').last,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Relato
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      width: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 1.0,
                        ),
                        /*boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(135, 120, 115, 150).withOpacity(0.5),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                  ),
                                ],*/
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Relato',
                          border: InputBorder.none,
                          filled: false,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //BotãoEnviar
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            print('Serie: $serie, Curso: $curso');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 9, 43, 77),
                            padding: const EdgeInsets.symmetric(horizontal: 85.0, vertical: 20.0),
                            textStyle: TextStyle(fontSize: 15.5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
                            elevation: 5.0,
                            shadowColor: const Color.fromARGB(169, 16, 12, 49),
                          ),
                          child: const Text(
                            'Enviar',
                            style: TextStyle(color: Colors.white),
                          ),
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
