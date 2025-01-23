import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Tecnico extends StatefulWidget {
  const Tecnico({super.key});

  @override
  State<Tecnico> createState() => _TecnicoState();
}

class _TecnicoState extends State<Tecnico> {
  final List<String> contents = [
    'Início',
    'Formulário',
    'Relatos',
  ];

  List<Map<String, dynamic>> alunos = [];
  String? selectedAluno;
  List<String> cursos = [];
  String? selectedCurso;
  String turmaid = '';
  List<String> alunosFiltrados = [];
  List<dynamic> dataAlunos = [];
  List<dynamic> dataCursos = [];
  String alunoId = '';
  List<dynamic> alunosId = [];
  String usuarioId = '';

  final TextEditingController _relatocontroller = TextEditingController();

  void initState() {
    super.initState();
    fetchAlunos();
    fetchCursos();
    idAluno();
  }

  Future<void> idAluno() async {
    try {
      Uri uri = Uri.http('localhost:3000', 'alunos');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          alunosId = data.map((aluno) => {'id': aluno['id'], 'name': aluno['name']}).toList();
        });
      } else {
        throw Exception('Falha ao carregar os dados dos alunos');
      }
    } catch (e) {
      print('Erro ao buscar dados dos alunos: $e');
    }
  }

  Future<void> fetchAlunos() async {
    try {
      Uri uri = Uri.http('localhost:3000', 'turmas/${turmaid}/alunos');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        dataAlunos = json.decode(response.body);
        print(response.body);
        setState(() {
          alunos = List<Map<String, dynamic>>.from(dataAlunos);
        });
      } else {
        throw Exception('Falha ao carregar os dados');
      }
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }

//Cursos
  Future<void> fetchCursos() async {
    try {
      Uri uri = Uri.http('localhost:3000', 'turmas');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        dataCursos = json.decode(response.body);
        print(response.body);
        setState(() {
          cursos = dataCursos
              .where((item) => [1, 2, 3, 4, 5, 6, 7, 8, 9].contains(item['id']))
              .map((item) => item['name'].toString())
              .toList();
        });
      } else {
        throw Exception('Falha ao carregar os dados');
      }
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }

  void filtrarAlunosPorCurso(String curso) {
    setState(() {
      alunosFiltrados =
          alunos.where((aluno) => aluno['turmaId'] == curso).map((aluno) => aluno['name'].toString()).toList();
      //selectedAluno = null;
      //print(alunosFiltrados);
    });
  }

  Future<void> salvarUsuarioId(String usuarioId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuarioId', usuarioId);
  }

//enviar relato

  Future<void> enviarRelato() async {
    try {
      // Recupera o sessionId das SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final sessionId = prefs.getString('sessionId');

      // Verifica se o sessionId foi recuperado corretamente
      if (sessionId == null || sessionId.isEmpty) {
        print('Session ID não encontrado');
        return; // Pode lançar um erro ou retornar
      }

      // Tenta encontrar o aluno selecionado
      final aluno = alunosId.firstWhere((aluno) => aluno['name'] == selectedAluno,
          orElse: () => {} as Map<String, dynamic> // Corrige o tipo explicitamente
          );

      print(aluno);

      // Verifica se o aluno foi encontrado
      if (aluno.isEmpty) {
        print('Aluno não encontrado: $selectedAluno');
        return;
      }

      final alunoId = aluno['id']; // ID do aluno
      //final turmaId = turmaid;  // ID da turma do aluno
      final description = _relatocontroller.text; // O conteúdo do relato

      // Verificação dos valores antes de enviar
      print('Aluno ID: $alunoId');
      print('usuarioId: $usuarioId');
      print('Description: $description');

      // Envia os dados para a API via POST
      final response = await http.post(
        Uri.parse('http://localhost:3000/denuncias'), // Use o IP da sua máquina, ou a URL do servidor
        headers: {
          'Content-Type': 'application/json',
          'session-id': sessionId,
          'usuarioId': usuarioId, // Envia o sessionId na header
        },
        body: json.encode({
          'description': description, // Descrição do relato
          'alunoId': alunoId,
          'usuarioId': usuarioId, // ID do aluno
          //'turmaId': turmaId,  // ID da turma
        }),
      );

      // Verifica a resposta do servidor
      if (response.statusCode == 201) {
        print('Relato enviado com sucesso');
        Navigator.pushReplacementNamed(context, 'relatos');
      } else {
        print('Falha ao enviar relato: ${response.statusCode} - ${response.body}');
        // Exibe o erro para o usuário
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao enviar relato: ${response.body}')),
        );
      }
    } catch (e) {
      // Em caso de erro, exibe no console ou trata de maneira apropriada
      print('Erro ao enviar relato: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar relato: $e')),
      );
    }
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              //Comuputador
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
                                  'Tecnico',
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
                              child: DropdownButton<String>(
                                hint: const Text(
                                  "Selecione o curso",
                                  style: TextStyle(color: Color.fromARGB(255, 23, 23, 23)),
                                ),
                                value: selectedCurso,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCurso = newValue;
                                    selectedAluno = null;
                                    turmaid =
                                        dataCursos.firstWhere((item) => item['name'] == selectedCurso)['id'].toString();
                                    fetchAlunos();
                                  });
                                },
                                isExpanded: true,
                                underline: Container(
                                  height: 1,
                                  color: const Color.fromARGB(255, 16, 16, 16),
                                ),
                                icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 25, 25, 25)),
                                items: cursos.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(color: Colors.white),
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
                              child: DropdownButton<String>(
                                hint: const Text(
                                  "Selecione o aluno",
                                  style: TextStyle(color: Color.fromARGB(255, 25, 25, 25)),
                                ),
                                value: selectedAluno,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedAluno = newValue;
                                  });
                                },
                                isExpanded: true,
                                underline: Container(
                                  height: 1,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 0, 0, 0)),
                                items: alunos.map<DropdownMenuItem<String>>((Map<String, dynamic> aluno) {
                                  return DropdownMenuItem<String>(
                                    value: aluno['name'].toString(),
                                    child: Text(
                                      aluno['name'].toString(),
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
                            ),
                            child: TextField(
                              controller: _relatocontroller,
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
                                enviarRelato();
                                //Navigator.pushReplacementNamed(context, 'relatos');
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
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 80,
                          child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                        ),
                        const Text(
                          'Graduação',
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 14, 37),
                            fontFamily: "Poppins-Bold",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                        child: DropdownButton<String>(
                          hint: const Text(
                            "Selecione o curso",
                            style: TextStyle(color: Color.fromARGB(255, 23, 23, 23)),
                          ),
                          value: selectedCurso,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCurso = newValue;
                              selectedAluno = null;
                              turmaid = dataCursos.firstWhere((item) => item['name'] == selectedCurso)['id'].toString();
                              fetchAlunos();
                            });
                          },
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: const Color.fromARGB(255, 16, 16, 16),
                          ),
                          icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 25, 25, 25)),
                          items: cursos.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
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
                        child: DropdownButton<String>(
                          hint: const Text(
                            "Selecione o aluno",
                            style: TextStyle(color: Color.fromARGB(255, 25, 25, 25)),
                          ),
                          value: selectedAluno,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedAluno = newValue;
                            });
                          },
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          icon: const Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 0, 0, 0)),
                          items: alunos.map<DropdownMenuItem<String>>((Map<String, dynamic> aluno) {
                            return DropdownMenuItem<String>(
                              value: aluno['name'].toString(),
                              child: Text(
                                aluno['name'].toString(),
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
                        onPressed: () {},
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
