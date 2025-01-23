import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class Denuncia {
  final String id;
  final String description;
  final String alunoId;
  final String usuarioId;
  final String turmaId; // Campo para armazenar o turmaId

  Denuncia({
    required this.id,
    required this.description,
    required this.alunoId,
    required this.usuarioId,
    required this.turmaId, // Inicialização do turmaId
  });

  factory Denuncia.fromJson(Map<String, dynamic> json) {
    return Denuncia(
      id: json['id'].toString(),
      description: json['description'],
      alunoId: json['alunoId'].toString(),
      usuarioId: json['usuarioId'].toString(),
      turmaId: json['turmaid'].toString(), // Extraindo o turmaId
    );
  }
}

// Função para buscar as denúncias
// Função para buscar as denúncias com filtro de turmaId
Future<List<Denuncia>> fetchDenuncias() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final sessionId = prefs.getString('sessionId');

    // Verifica se o sessionId foi recuperado corretamente
    if (sessionId == null || sessionId.isEmpty) {
      print('Session ID não encontrado');
      return []; // Pode lançar um erro ou retornar
    }

    // Enviando requisição com o session-id
    final response = await http.get(
      Uri.parse('http://localhost:3000/denuncias/userId'), // Troque 'localhost' para o IP da sua máquina se for necessário
      headers: {
        'session-id': sessionId, // Enviando o session-id no cabeçalho
      },
    );

    if (response.statusCode == 200) {
      // Converte a resposta para uma lista de denúncias
      Iterable l = json.decode(response.body);
      List<Denuncia> denuncias = List<Denuncia>.from(l.map((model) => Denuncia.fromJson(model)));

      // Filtra as denúncias por turmaId igual a 4, 5 ou 6
      List<Denuncia> denunciasFiltradas = denuncias.where((denuncia) {
        return denuncia.turmaId == '4' || denuncia.turmaId == '5' || denuncia.turmaId == '6';
      }).toList();

      return denunciasFiltradas; // Retorna a lista filtrada
    } else {
      throw Exception('Falha em carregar denúncias');
    }
  } catch (e) {
    print('Erro ao buscar denúncias: $e');
    return [];
  }
}

Future<String> fetchUsuarioNome(String usuarioId) async {
  try {
    final response = await http.get(Uri.parse('http://localhost:3000/usuarios/$usuarioId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['username'];
    } else {
      throw Exception('Falha ao carregar o nome do usuário');
    }
  } catch (e) {
    print('Erro ao buscar nome do usuário: $e');
    return 'Usuário não encontrado';
  }
}

Future<String> fetchAlunoNome(String alunoId) async {
  try {
    final response = await http.get(Uri.parse('http://localhost:3000/alunos/$alunoId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['name']; // Supondo que o nome do aluno esteja no campo 'name'
    } else {
      throw Exception('Falha ao carregar o nome do aluno');
    }
  } catch (e) {
    print('Erro ao buscar nome do aluno: $e');
    return 'Aluno não encontrado';
  }
}

Future<String> fetchTurmaNome(String turmaId) async {
  try {
    final response = await http.get(Uri.parse('http://localhost:3000/turmas/$turmaId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['name']; // Supondo que o nome da turma esteja no campo 'name'
    } else {
      throw Exception('Falha ao carregar o nome da turma');
    }
  } catch (e) {
    print('Erro ao buscar nome da turma: $e');
    return 'Turma não encontrada';
  }
}

class _InfoState extends State<Info> {
  late Future<List<Denuncia>> futureDenuncias;

  @override
  void initState() {
    super.initState();
    futureDenuncias = fetchDenuncias(); // Carrega as denúncias ao inicializar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 24, 52, 70),
        automaticallyImplyLeading: true,
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
              'SAD',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu, color: Colors.white, size: 35.0),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 206, 232, 230),
        child: Row(
          children: [
            //BarraLateral
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: const Color.fromARGB(255, 104, 139, 161),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Center(
                              child: SizedBox(
                                width: 120,
                                height: 120,
                                child: Image.asset('assets/images/sad.png', fit: BoxFit.contain),
                              ),
                            ),
                            Text(
                              'Info',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: LayoutBuilder(
                          builder: (context, constraints) {
                            double fontSize = constraints.maxWidth < 500 ? 12.0 : 22.0;
                            return Text(
                              'INFORMÁTICA',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize,
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'info');
                        },
                      ),
                      ListTile(
                        title: LayoutBuilder(
                          builder: (context, constraints) {
                            double fontSize = constraints.maxWidth < 500 ? 12.0 : 22.0;
                            return Text(
                              'MECATRÔNICA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize,
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'meca');
                        },
                      ),
                      ListTile(
                        title: LayoutBuilder(
                          builder: (context, constraints) {
                            double fontSize = constraints.maxWidth < 500 ? 12.0 : 22.0;
                            return Text(
                              'MODA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize,
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'moda');
                        },
                      ),
                      ListTile(
                        title: LayoutBuilder(
                          builder: (context, constraints) {
                            double fontSize = constraints.maxWidth < 500 ? 12.0 : 22.0;
                            return Text(
                              'GERAL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize,
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'cursos');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Relatos
            //Dentro do Container tem que chamar a API
            Expanded(
              child: FutureBuilder<List<Denuncia>>(
                future: futureDenuncias,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhuma denúncia encontrada.'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final denuncia = snapshot.data![index];

                          return FutureBuilder<Map<String, String>>(
                            future: Future.wait([
                              fetchUsuarioNome(denuncia.usuarioId), // Requisição para buscar o nome do usuário
                              fetchAlunoNome(denuncia.alunoId), // Requisição para buscar o nome do aluno
                              fetchTurmaNome(denuncia.turmaId), // Requisição para buscar o nome da turma
                            ]).then((results) {
                              return {
                                'usuarioNome': results[0], // Nome do usuário
                                'alunoNome': results[1], // Nome do aluno
                                'turmaNome': results[2], // Nome da turma
                              };
                            }),
                            builder: (context, userAndAlunoAndTurmaSnapshot) {
                              if (userAndAlunoAndTurmaSnapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (userAndAlunoAndTurmaSnapshot.hasError) {
                                return Card(
                                  color: const Color.fromARGB(255, 181, 204, 219),
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: ListTile(
                                    title: Text(denuncia.usuarioId, style: TextStyle(color: Colors.white)),
                                    subtitle: Text(
                                      denuncia.description,
                                      style: TextStyle(color: Colors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              } else if (!userAndAlunoAndTurmaSnapshot.hasData) {
                                return Card(
                                  color: const Color.fromARGB(255, 181, 204, 219),
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: ListTile(
                                    title: Text('Usuário, Aluno ou Turma não encontrados',
                                        style: TextStyle(color: Colors.white)),
                                    subtitle: Text(
                                      denuncia.description,
                                      style: TextStyle(color: Colors.white),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              } else {
                                final usuarioNome = userAndAlunoAndTurmaSnapshot.data!['usuarioNome']!;
                                final alunoNome = userAndAlunoAndTurmaSnapshot.data!['alunoNome']!;
                                final turmaNome = userAndAlunoAndTurmaSnapshot.data!['turmaNome']!;

                                return Card(
                                  color: const Color.fromARGB(255, 181, 204, 219),
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: ListTile(
                                    title: Text(usuarioNome, style: TextStyle(color: Colors.white)),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          alunoNome, // Nome do aluno
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          turmaNome, // Nome da turma
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          denuncia.description, // Descrição da denúncia
                                          style: TextStyle(color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      // Lógica para mostrar detalhes, por exemplo
                                    },
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 24, 52, 70),
        child: SizedBox(
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
    );
  }
}
