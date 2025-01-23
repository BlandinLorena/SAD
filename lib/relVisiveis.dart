import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RelVis extends StatefulWidget {
  const RelVis({super.key});

  @override
  State<RelVis> createState() => _RelVisState();
}

class _RelVisState extends State<RelVis> {
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
                  height: MediaQuery.of(context).size.height * 0.7,
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
                              'Opções',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: const Color.fromARGB(255, 2, 32, 56),),
                      ListTile(
                        title: LayoutBuilder(
                          builder: (context, constraints) {
                            double fontSize = constraints.maxWidth < 400 ? 12.0 : 18.0;
                            return Text(
                              'MEUS RELATOS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize,
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'relatos');
                        },
                      ),
                      ListTile(
                        title: LayoutBuilder(
                          builder: (context, constraints) {
                            double fontSize = constraints.maxWidth < 500 ? 12.0 : 22.0;
                            return Text(
                              'MAIS RELATOS\nVISÍVEIS',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize,
                              ),
                            );
                          },
                        ),
                        onTap: () {
                           Navigator.pushNamed(context, 'relVis');
                        },
                      ),
                      ]),
                ),
              ),
            ),
            //Relatos
            //Dentro do Container tem que chamar a API
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 206, 232, 230),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Relatos Visíveis...',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 13, 59, 91),
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color.fromARGB(255, 181, 204, 219),
                              margin: EdgeInsets.only(bottom: 16),
                              child: ListTile(
                                title: Text('ANÔNIMO', style: TextStyle(color: Colors.white)),
                                subtitle: Text(
                                  'HBJDBAHDAWNKNDKEJ KJWN...\n\nLer mais...',
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 24, 52, 70),
        child: SizedBox(
          //height: 20.0,
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
