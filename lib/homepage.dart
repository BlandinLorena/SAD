import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContributorCircleAvatar extends StatefulWidget {
  final String imagePath;
  final String contributorName;

  ContributorCircleAvatar({required this.imagePath, required this.contributorName});

  @override
  _ContributorCircleAvatarState createState() => _ContributorCircleAvatarState();
}

class _ContributorCircleAvatarState extends State<ContributorCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.8),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightBlue.withOpacity(0.3),
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.imagePath),
              radius: 45,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.contributorName,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Poppins-Bold",
              fontSize: 14.75,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> contents = ['Início', 'Cadastro'];
  bool isExpanded = false;
  int expandedIndex = -1;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 232, 230),
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
              widget.title,
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
              return contents.map((content) {
                return PopupMenuItem<String>(
                  value: content,
                  child: Text(
                    content,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                );
              }).toList();
            },
            onSelected: (value) {
              switch (value) {
                case 'Início':
                  Navigator.pushNamed(context, '/');
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          //ApresentaçãoDoProjeto
          LayoutBuilder(
            builder: (context, constraints) {
              double containerWidth;
              double rightPosition;
              double fontSizeTitle;
              double fontSizeSubtitle;
              double fontSizeDescription;
              double topImage;
              double rightSetence;
              double heightContainer;
              double rightButton;
              double bottomButton;
              double bottomSetence;
              double widthButton;
              if (constraints.maxWidth > 1200) {
                //PC
                containerWidth = MediaQuery.of(context).size.width;
                rightPosition = containerWidth * 0.5;
                rightSetence = containerWidth * 0.1;
                bottomSetence = 140;
                rightButton = containerWidth * 0.24;
                bottomButton = 80;
                heightContainer = MediaQuery.of(context).size.height * 0.7;
                topImage = MediaQuery.of(context).size.height * 0.001;
                fontSizeTitle = 50;
                fontSizeSubtitle = 24;
                fontSizeDescription = 18;
                widthButton = MediaQuery.of(context).size.width * 0.12;
              } else if (constraints.maxWidth > 600) {
                //Tablet
                containerWidth = MediaQuery.of(context).size.width;
                rightPosition = containerWidth * 0.3;
                rightSetence = containerWidth * 0.13;
                bottomSetence = 110;
                rightButton = containerWidth * 0.33;
                bottomButton = 50;
                heightContainer = MediaQuery.of(context).size.height * 0.7;
                topImage = MediaQuery.of(context).size.height * 0.1;
                fontSizeTitle = 40;
                fontSizeSubtitle = 20;
                fontSizeDescription = 14;
                widthButton = MediaQuery.of(context).size.width * 0.3;
              } else {
                //Celular
                containerWidth = MediaQuery.of(context).size.width;
                rightPosition = (MediaQuery.of(context).size.width - containerWidth * 0.4) / 2;
                rightSetence = 75;
                bottomSetence = 130;
                rightButton = 90;
                bottomButton = 60;
                heightContainer = MediaQuery.of(context).size.height * 0.6;
                topImage = MediaQuery.of(context).size.height * 0.16;
                fontSizeTitle = 32;
                fontSizeSubtitle = 20;
                fontSizeDescription = 12;
                widthButton = MediaQuery.of(context).size.width * 0.45;
              }
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: containerWidth,
                          height: heightContainer,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color.fromARGB(255, 104, 139, 161),
                              const Color.fromARGB(255, 188, 222, 243),
                            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                            /*borderRadius: BorderRadius.circular(40.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],*/
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 20,
                          right: 20,
                          child: Center(
                            child: Text(
                              'SISTEMA ANÔNIMO DE DEPOIMENTOS',
                              style: TextStyle(
                                fontSize: fontSizeTitle,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Positioned(
                          top: topImage,
                          right: rightPosition,
                          child: Image.asset(
                            'assets/images/sad.png',
                            width: containerWidth * 0.4,
                            height: containerWidth * 0.4,
                          ),
                        ),
                        Positioned(
                          bottom: bottomSetence,
                          right: rightSetence,
                          child: Column(
                            children: [
                              if (constraints.maxWidth > 600)
                                Text(
                                  'CONECTANDO CORAÇÕES E MENTES ANÔNIMAMENTE!',
                                  style: TextStyle(
                                    fontSize: fontSizeSubtitle,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 117, 117, 117),
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              else
                                Text(
                                  'CONECTANDO CORAÇÕES E\n MENTES ANÔNIMAMENTE!',
                                  style: TextStyle(
                                    fontSize: fontSizeSubtitle,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 117, 117, 117),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              const SizedBox(height: 20),
                              Text(
                                'UM ESPAÇO SEGURO PARA ENCONTRAR\n APOIO, COMPREENSÃO E ORIENTAÇÃO.',
                                style: TextStyle(
                                  fontSize: fontSizeDescription,
                                  fontFamily: "Poppins",
                                  color: const Color.fromARGB(255, 122, 121, 121),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: bottomButton,
                          right: rightButton,
                          //height: 40,
                          child: ElevatedButton(
                            child: Container(
                              width: widthButton,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: const Text(
                                    'Faça login',
                                    style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'cadastro');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 12, 47, 69),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          //InformaçõesDoençasColunas
          Container(
            padding: const EdgeInsets.only(top: 50.0),
            child: LayoutBuilder(builder: (context, constraints) {
              //Computador
              if (constraints.maxWidth > 800) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedIndex = expandedIndex == 0 ? -1 : 0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(17.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 104, 139, 161),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          width: expandedIndex == 0
                              ? MediaQuery.of(context).size.width * 0.34
                              : MediaQuery.of(context).size.width * 0.17,
                          height: expandedIndex == 0
                              ? MediaQuery.of(context).size.height * 0.9
                              : MediaQuery.of(context).size.height * 0.83,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ContributorCircleAvatar(
                                imagePath: 'assets/images/depressao.png',
                                contributorName: '',
                              ),
                              Text(
                                "Depressão:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: expandedIndex == 0 ? 20 : 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "A depressão é uma doença mental grave que afeta 5,8% da população brasileira, ou cerca de 11,7 milhões de pessoas, segundo a OMS. Estima-se que 15,5% dos brasileiros enfrentam a depressão ao longo da vida, de acordo com o Ministério da Saúde. O Transtorno Depressivo Maior (TDM) é o mais comum e pode variar em severidade e características, como sintomas  ansiosos ou psicóticos. Além do TDM, o Transtorno Depressivo Persistente, TDP, ou distimia, é uma forma crônica de depressão, com sintomas contínuos que duram pelo menos dois anos, afetando a qualidade de vida. ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: expandedIndex == 0 ? 18 : 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 80),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedIndex = expandedIndex == 1 ? -1 : 1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(17.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 104, 139, 161),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          width: expandedIndex == 1
                              ? MediaQuery.of(context).size.width * 0.34
                              : MediaQuery.of(context).size.width * 0.17,
                          height: expandedIndex == 1
                              ? MediaQuery.of(context).size.height * 0.9
                              : MediaQuery.of(context).size.height * 0.83,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ContributorCircleAvatar(
                                imagePath: 'assets/images/ansiedade.png',
                                contributorName: '',
                              ),
                              Text(
                                "Ansiedade:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: expandedIndex == 1 ? 20 : 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "O Brasil é o país com maior índice de ansiedade no mundo, com cerca de 9,3% da população sofrendo de ansiedade patológica, especialmente entre jovens de 18 a 24 anos, sendo um terço afetado. A pandemia de COVID19 agravou esse cenário. A ansiedade é um transtorno mental e físico, com causas tanto genéticas quanto relacionadas às experiências de vida. Historicamente, o termo está ligado à ideia de estreiteza e, na antiguidade, era vista como uma falha ética. Apenas no século XIX a ansiedade foi reconhecida como uma condição patológica. ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: expandedIndex == 1 ? 18 : 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 80),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedIndex = expandedIndex == 2 ? -1 : 2;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(17.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 104, 139, 161),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          width: expandedIndex == 2
                              ? MediaQuery.of(context).size.width * 0.34
                              : MediaQuery.of(context).size.width * 0.17,
                          height: expandedIndex == 2
                              ? MediaQuery.of(context).size.height * 0.9
                              : MediaQuery.of(context).size.height * 0.83,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ContributorCircleAvatar(
                                imagePath: 'assets/images/tdah.png',
                                contributorName: '',
                              ),
                              Text(
                                "TDAH:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: expandedIndex == 2 ? 20 : 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "O Transtorno do Déficit de Atenção/Hiperatividade(TDAH) é caracterizado por comportamentos como agitação, impulsividade e desorganização. Afeta tanto crianças quanto adultos, que podem ter dificuldade em focar, completar tarefas e controlar impulsos. O TDAH é uma disfunção neuropsiquiátrica que impacta as funções executivas do cérebro, como o autocontrole. Desde as décadas de 1980 e 1990, a compreensão neurobiológica do transtorno se tornou dominante, mostrando que suas causas estão ligadas a fatores biológicos, genéticos e cerebrais, sendo esses fatores os mais importantes no desenvolvimento da patologia.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: expandedIndex == 2 ? 18 : 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              //Tablet
              if (constraints.maxWidth > 600) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedIndex = expandedIndex == 0 ? -1 : 0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(17.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 104, 139, 161),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          width: expandedIndex == 0
                              ? MediaQuery.of(context).size.width * 0.34
                              : MediaQuery.of(context).size.width * 0.3,
                          height: expandedIndex == 0
                              ? MediaQuery.of(context).size.height * 0.9
                              : MediaQuery.of(context).size.height * 0.77,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ContributorCircleAvatar(
                                  imagePath: 'assets/images/depressao.png',
                                  contributorName: '',
                                ),
                                Text(
                                  "Depressão:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: expandedIndex == 0 ? 18 : 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "A depressão é uma doença mental grave que afeta 5,8% da população brasileira, ou cerca de 11,7 milhões de pessoas, segundo a OMS. Estima-se que 15,5% dos brasileiros enfrentam a depressão ao longo da vida, de acordo com o Ministério da Saúde. O Transtorno Depressivo Maior (TDM) é o mais comum e pode variar em severidade e características, como sintomas  ansiosos ou psicóticos. Além do TDM, o Transtorno Depressivo Persistente, TDP, ou distimia, é uma forma crônica de depressão, com sintomas contínuos que duram pelo menos dois anos, afetando a qualidade de vida. ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: expandedIndex == 0 ? 16 : 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedIndex = expandedIndex == 1 ? -1 : 1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(17.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 104, 139, 161),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          width: expandedIndex == 1
                              ? MediaQuery.of(context).size.width * 0.34
                              : MediaQuery.of(context).size.width * 0.3,
                          height: expandedIndex == 1
                              ? MediaQuery.of(context).size.height * 0.9
                              : MediaQuery.of(context).size.height * 0.77,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ContributorCircleAvatar(
                                  imagePath: 'assets/images/ansiedade.png',
                                  contributorName: '',
                                ),
                                Text(
                                  "Ansiedade:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: expandedIndex == 1 ? 28 : 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "O Brasil é o país com maior índice de ansiedade no mundo, com cerca de 9,3% da população sofrendo de ansiedade patológica, especialmente entre jovens de 18 a 24 anos, sendo um terço afetado. A pandemia de COVID19 agravou esse cenário. A ansiedade é um transtorno mental e físico, com causas tanto genéticas quanto relacionadas às experiências de vida. Historicamente, o termo está ligado à ideia de estreiteza e, na antiguidade, era vista como uma falha ética. Apenas no século XIX a ansiedade foi reconhecida como uma condição patológica. ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: expandedIndex == 1 ? 16 : 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedIndex = expandedIndex == 2 ? -1 : 2;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(17.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 104, 139, 161),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          width: expandedIndex == 2
                              ? MediaQuery.of(context).size.width * 0.34
                              : MediaQuery.of(context).size.width * 0.3,
                          height: expandedIndex == 2
                              ? MediaQuery.of(context).size.height * 0.9
                              : MediaQuery.of(context).size.height * 0.77,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ContributorCircleAvatar(
                                  imagePath: 'assets/images/tdah.png',
                                  contributorName: '',
                                ),
                                Text(
                                  "TDAH:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: expandedIndex == 2 ? 28 : 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "O Transtorno do Déficit de Atenção/Hiperatividade(TDAH) é caracterizado por comportamentos como agitação, impulsividade e desorganização. Afeta tanto crianças quanto adultos, que podem ter dificuldade em focar, completar tarefas e controlar impulsos. O TDAH é uma disfunção neuropsiquiátrica que impacta as funções executivas do cérebro, como o autocontrole. Desde as décadas de 1980 e 1990, a compreensão neurobiológica do transtorno se tornou dominante, mostrando que suas causas estão ligadas a fatores biológicos, genéticos e cerebrais, sendo esses fatores os mais importantes no desenvolvimento da patologia.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: expandedIndex == 2 ? 16 : 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              //Celular
              else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: PageView(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(17.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                    offset: const Offset(0, 10),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: const Color.fromARGB(255, 104, 139, 161),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ContributorCircleAvatar(
                                      imagePath: 'assets/images/depressao.png',
                                      contributorName: '',
                                    ),
                                    const Text(
                                      "Depressão:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: "Arial Rounded MT Bold",
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        "A depressão é uma doença mental grave que afeta 5,8% da população brasileira, ou cerca de 11,7 milhões de pessoas, segundo a OMS. Estima-se que 15,5% dos brasileiros enfrentam a depressão ao longo da vida, de acordo com o Ministério da Saúde. O Transtorno Depressivo Maior (TDM) é o mais comum e pode variar em severidade e características, como sintomas  ansiosos ou psicóticos. Além do TDM, o Transtorno Depressivo Persistente, TDP, ou distimia, é uma forma crônica de depressão, com sintomas contínuos que duram pelo menos dois anos, afetando a qualidade de vida. ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Arial Rounded MT Bold",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: MediaQuery.of(context).size.height * 0.3,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                    offset: const Offset(0, 10),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: const Color.fromARGB(255, 104, 139, 161),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ContributorCircleAvatar(
                                      imagePath: 'assets/images/ansiedade.png',
                                      contributorName: '',
                                    ),
                                    const Text(
                                      "Ansiedade:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: "Arial Rounded MT Bold",
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        "O Brasil é o país com maior índice de ansiedade no mundo, com cerca de 9,3% da população sofrendo de ansiedade patológica, especialmente entre jovens de 18 a 24 anos, sendo um terço afetado. A pandemia de COVID19 agravou esse cenário. A ansiedade é um transtorno mental e físico, com causas tanto genéticas quanto relacionadas às experiências de vida. Historicamente, o termo está ligado à ideia de estreiteza e, na antiguidade, era vista como uma falha ética. Apenas no século XIX a ansiedade foi reconhecida como uma condição patológica. ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Arial Rounded MT Bold",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: MediaQuery.of(context).size.height * 0.3,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 104, 139, 161),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ContributorCircleAvatar(
                                  imagePath: 'assets/images/tdah.png',
                                  contributorName: '',
                                ),
                                const Text(
                                  "TDAH:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Arial Rounded MT Bold",
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    "O Transtorno do Déficit de Atenção/Hiperatividade(TDAH) é caracterizado por comportamentos como agitação, impulsividade e desorganização. Afeta tanto crianças quanto adultos, que podem ter dificuldade em focar, completar tarefas e controlar impulsos. O TDAH é uma disfunção neuropsiquiátrica que impacta as funções executivas do cérebro, como o autocontrole. Desde as décadas de 1980 e 1990, a compreensão neurobiológica do transtorno se tornou dominante, mostrando que suas causas estão ligadas a fatores biológicos, genéticos e cerebrais, sendo esses fatores os mais importantes no desenvolvimento da patologia.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Arial Rounded MT Bold",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
          //StackAutoDiagnostico
          Stack(
            children: <Widget>[
              LayoutBuilder(
                builder: (context, constraints) {
                  double containerHeight;
                  double containerWidth;
                  double paddingTop;
                  double paddingLeft;
                  double innerPaddingTop;
                  double innerPaddingLeft;
                  double AutoFontSize;
                  if (constraints.maxWidth > 1200) {
                    //Computador
                    containerWidth = MediaQuery.of(context).size.width * 0.55;
                    containerHeight = MediaQuery.of(context).size.height * 0.5;
                    paddingTop = 80.0;
                    paddingLeft = 10.0;
                    innerPaddingTop = 50.0;
                    innerPaddingLeft = 50.0;
                    AutoFontSize = 36.0;
                  } else if (constraints.maxWidth > 500) {
                    //Tablet
                    containerWidth = MediaQuery.of(context).size.width * 0.7;
                    containerHeight = MediaQuery.of(context).size.height * 0.45;
                    paddingTop = 60.0;
                    paddingLeft = 50.0;
                    innerPaddingTop = 50.0;
                    innerPaddingLeft = 50.0;
                    AutoFontSize = 36.0;
                  } else {
                    //Celular
                    containerWidth = MediaQuery.of(context).size.width * 0.75;
                    containerHeight = MediaQuery.of(context).size.height * 0.45;
                    paddingTop = 75.0;
                    paddingLeft = 15.0;
                    innerPaddingTop = 40.0;
                    innerPaddingLeft = 50.0;
                    AutoFontSize = 30.0;
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: paddingTop, left: paddingLeft),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                offset: const Offset(0, 10),
                                blurRadius: 10,
                              ),
                            ],
                            color: const Color.fromARGB(255, 21, 58, 81),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          height: containerHeight,
                          width: containerWidth,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: innerPaddingTop, left: innerPaddingLeft),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                  offset: const Offset(0, 10),
                                  blurRadius: 10,
                                ),
                              ],
                              color: const Color.fromARGB(255, 117, 155, 179),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            height: containerHeight,
                            width: containerWidth,
                            child: Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Autodiagnóstico",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: AutoFontSize,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        "O ato de se autodiagnosticar é muito perigoso, e é um acontecimento cada vez mais comum. Ele pode acontecer por causa de desinformação, e o principal veículo para acessar essas informações falsas é a internet e as redes sociais. Com a popularização de vídeos curtos, como Tik Tok e Reels, esse diagnóstico se tornou muito comum, para várias doenças e especialmente transtornos mentais. O roteiro é o mesmo, o usuário cai nesses vídeos, que contém uma lista de possíveis sintomas, geralmente genéricos, e uma explicação bem falha deles, e ao se “identificar” com uma certa quantidade, o diagnóstico está feito. Já que o alcance e engajamento desse conteúdo é enorme e a verificação da veracidade é algo inexistente.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        " O diagnóstico desse tipo de transtorno é complexo e deve ser realizado por profissionais. É feito por meio de entrevistas com o paciente e pessoas da sua convivência. Os profissionais tentam entender o padrão de comportamento dos indivíduos e esse processo pode levar até meses. Por isso, é importante o papel do profissional nessa jornada e não deve ser banalizado. Essa banalização torna não apenas o diagnóstico algo “simples”, mas também o tratamento e a compreensão dos transtornos, já que usar termos como “bipolar”, “hiperativo” ou “ansioso” de forma casual, pode normalizar, de forma errada, a incidência desses casos.",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 80),
          // Bullying
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                // Computador
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying1.png',
                              contributorName: '',
                            ),
                            const Text(
                              'A violência é um problema global crescente que afeta a saúde individual e social, com jovens sendo tanto as principais vítimas quanto perpetradores. A violência juvenil, praticada por pessoas entre 10 e 21 anos, é uma das formas mais visíveis desse fenômeno. Quando o comportamento violento surge antes da puberdade, ele tende a se intensificar na adolescência e, em alguns casos, persiste na vida adulta, impactando não só os envolvidos diretamente, mas também suas famílias e comunidades.',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying2.png',
                              contributorName: '',
                            ),
                            const Text(
                              'Essa dinâmica revela como a falta de uma formação crítica e humanizadora perpetua ciclos de violência e sofrimento. Além disso, a educação deve ser um espaço de conscientização, onde as crianças aprendem a reconhecer suas próprias emoções e a entender o impacto de suas ações nos outros. Quando a educação falha em abordar questões como bullying, preconceito e exclusão, cria-se um ambiente propício para que a violência persista. Aqueles que foram vítimas de opressão podem, ao se tornarem opressores, tentar compensar suas próprias experiências traumáticas, sem perceber que estão contribuindo para um ciclo destrutivo. ',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying3.png',
                              contributorName: '',
                            ),
                            const Text(
                              'Normalmente, as vítimas de bullying apresentam um padrão que inclui características como timidez, recato e uma tendência à exclusão social. Muitas vezes, essas crianças se sentem isoladas, o que as torna alvos mais fáceis para os agressores. Diferente dos opressores, que costumam ser aqueles que se destacam socialmente, por serem “populares”, extrovertidos e, em alguns casos, manipuladores. É importante reconhecer que esses comportamentos não surgem do nada, eles podem ser reflexos de inseguranças pessoais, de pressões sociais ou mesmo de modelos familiares disfuncionais. ',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying4.png',
                              contributorName: '',
                            ),
                            const Text(
                              'Pessoas que sofrem bullying quando crianças são mais propensas a sofrerem depressão, ansiedade e baixa auto-estima na vida adulta, prejuízos financeiros e sociais causados pelo bullying impactam não apenas as vítimas e os agressores, mas também suas famílias, relacionamentos , profissões e a sociedade como um todo. Crianças e adolescentes que sofreram ou praticaram bullying na infância, necessitam de múltiplos serviços, como acompanhamento de psicólogos e psiquiatras, educação especial e programas sociais de suporte. Esses serviços não são apenas custos diretos, mas também refletem uma perda significativa de potencial humano e social.',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (constraints.maxWidth > 600) {
                // Tablet
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying1.png',
                              contributorName: '',
                            ),
                            const Text(
                              'A violência é um problema global crescente que afeta a saúde individual e social, com jovens sendo tanto as principais vítimas quanto perpetradores. A violência juvenil, praticada por pessoas entre 10 e 21 anos, é uma das formas mais visíveis desse fenômeno. Quando o comportamento violento surge antes da puberdade, ele tende a se intensificar na adolescência e, em alguns casos, persiste na vida adulta, impactando não só os envolvidos diretamente, mas também suas famílias e comunidades.',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying2.png',
                              contributorName: '',
                            ),
                            const Text(
                              'Essa dinâmica revela como a falta de uma formação crítica e humanizadora perpetua ciclos de violência e sofrimento. Além disso, a educação deve ser um espaço de conscientização, onde as crianças aprendem a reconhecer suas próprias emoções e a entender o impacto de suas ações nos outros. Quando a educação falha em abordar questões como bullying, preconceito e exclusão, cria-se um ambiente propício para que a violência persista. Aqueles que foram vítimas de opressão podem, ao se tornarem opressores, tentar compensar suas próprias experiências traumáticas, sem perceber que estão contribuindo para um ciclo destrutivo. ',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying3.png',
                              contributorName: '',
                            ),
                            const Text(
                              'Normalmente, as vítimas de bullying apresentam um padrão que inclui características como timidez, recato e uma tendência à exclusão social. Muitas vezes, essas crianças se sentem isoladas, o que as torna alvos mais fáceis para os agressores. Diferente dos opressores, que costumam ser aqueles que se destacam socialmente, por serem “populares”, extrovertidos e, em alguns casos, manipuladores. É importante reconhecer que esses comportamentos não surgem do nada, eles podem ser reflexos de inseguranças pessoais, de pressões sociais ou mesmo de modelos familiares disfuncionais. ',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.55,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: const Color.fromARGB(255, 181, 204, 219),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContributorCircleAvatar(
                              imagePath: 'assets/images/bullying4.png',
                              contributorName: '',
                            ),
                            const Text(
                              'Pessoas que sofrem bullying quando crianças são mais propensas a sofrerem depressão, ansiedade e baixa auto-estima na vida adulta, prejuízos financeiros e sociais causados pelo bullying impactam não apenas as vítimas e os agressores, mas também suas famílias, relacionamentos , profissões e a sociedade como um todo. Crianças e adolescentes que sofreram ou praticaram bullying na infância, necessitam de múltiplos serviços, como acompanhamento de psicólogos e psiquiatras, educação especial e programas sociais de suporte. Esses serviços não são apenas custos diretos, mas também refletem uma perda significativa de potencial humano e social.',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                // Celular
                return Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: ListView(
                    padding: const EdgeInsets.all(12.0),
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: const Color.fromARGB(255, 117, 155, 179),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/bullying1.png'),
                              radius: 40,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'A violência é um problema global crescente que afeta a saúde individual e social, com jovens sendo tanto as principais vítimas quanto perpetradores. A violência juvenil, praticada por pessoas entre 10 e 21 anos, é uma das formas mais visíveis desse fenômeno. Quando o comportamento violento surge antes da puberdade, ele tende a se intensificar na adolescência e, em alguns casos, persiste na vida adulta, impactando não só os envolvidos diretamente, mas também suas famílias e comunidades.',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.72,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: const Color.fromARGB(255, 117, 155, 179),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/bullying2.png'),
                              radius: 40,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Essa dinâmica revela como a falta de uma formação crítica e humanizadora perpetua ciclos de sofrimento. Além disso, a educação deve ser um espaço de conscientização, onde as crianças aprendem a reconhecer suas próprias emoções e a entender o impacto de suas ações nos outros. Quando a educação falha em abordar questões como bullying e preconceito, cria-se um ambiente propício para que a violência persista. Aqueles que foram vítimas de opressão podem, ao se tornarem opressores, tentar compensar suas próprias experiências traumáticas, sem perceber que estão contribuindo para um ciclo destrutivo. ',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: const Color.fromARGB(255, 117, 155, 179),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/bullying3.png'),
                              radius: 40,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Normalmente, as vítimas de bullying apresentam um padrão que inclui características como timidez e uma tendência à exclusão social. Muitas vezes, essas crianças se sentem isoladas, o que as torna alvos mais fáceis para os agressores. Diferente dos opressores, que costumam ser aqueles que se destacam socialmente, por serem extrovertidos e, em alguns casos, manipuladores. É importante reconhecer que esses comportamentos não surgem do nada, eles podem ser reflexos de inseguranças pessoais, de pressões sociais ou de modelos familiares disfuncionais. ',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.72,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(224, 2, 3, 28).withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: const Color.fromARGB(255, 117, 155, 179),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/images/bullying4.png'),
                              radius: 40,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Pessoas que sofrem bullying quando crianças são mais propensas a sofrerem depressão, ansiedade, prejuízos financeiros e sociais causados pelo bullying impactam não apenas as vítimas e os agressores, mas também suas famílias, relacionamentos , profissões e a sociedade como um todo. Crianças e adolescentes que sofreram ou praticaram bullying na infância, necessitam de múltiplos serviços, como acompanhamento de psicólogos e psiquiatras e programas sociais de suporte. Esses serviços não são apenas custos diretos, mas também refletem uma perda significativa de potencial humano e social.',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          //SobreProjeto
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                //Layout para computadores
                return Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 60.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(60.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                              offset: const Offset(0, 10),
                              blurRadius: 10,
                            ),
                          ],
                          color: const Color.fromARGB(255, 21, 48, 66),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Sobre o projeto:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Como surgiu?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "No início uma de nossas fundadoras, a Lorena, teve essa ideia apenas para ser o tema do nosso trabalho de conclusão de curso, o TCC, mas depois percebemos o quão grave é essa situação, principalmente nos dias de hoje. Então decidimos nos solidarizar e entrar mais a fundo na nossa ideia.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Quais os objetivos?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Os objetivos do projeto é ajudar os alunos da instituição de uma forma prática e eficaz, fazendo com que não precisem procurar o coordenador acadêmico de cada curso para resolver seu problema. Além de informar sobre o assunto para todos os outros alunos, sabendo que é um tema bem recorrente na atualidade.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 26.0),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Por que escolhemos esse tema?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontFamily: "Poppins-Bold",
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Os percentuais de problemas mentais têm crescido cada vez mais, não só em nosso país, mas no mundo todo. Segundo a Organização Mundial da Saúde (OMS), a depressão e a ansiedade aumentaram mais de 25% apenas no primeiro ano da pandemia. Pensando nisso, observamos os recentes casos de transtornos mentais no CEFET. Então desenvolvemos esse projeto para facilitar o auxílio à essas pessoas, por meio dos relatos, com o objetivo de facilitar a conversa e fornecer toda a ajuda necessária. O projeto também facilitaria o trabalho das Coordenações em observar e cuidar dos alunos.",
                                            style: TextStyle(color: Colors.white, fontFamily: "Poppins-Regular"),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              "Desenvolvedoras:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, left: 80.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () =>
                                            launchUrl(Uri.parse('https://www.instagram.com/mariattmedeiros_/')),
                                        child: ContributorCircleAvatar(
                                          imagePath: 'assets/images/teresa.jpg',
                                          contributorName: 'Maria Medeiros',
                                        ),
                                      ),
                                      const SizedBox(width: 220.0),
                                      GestureDetector(
                                        onTap: () => launchUrl(Uri.parse('https://www.instagram.com/blandin_lorena/')),
                                        child: ContributorCircleAvatar(
                                          imagePath: 'assets/images/blandin.jpg',
                                          contributorName: 'Lorena Blandin',
                                        ),
                                      ),
                                      const SizedBox(width: 220.0),
                                      GestureDetector(
                                        onTap: () => launchUrl(Uri.parse('https://www.instagram.com/maysaj__/')),
                                        child: ContributorCircleAvatar(
                                          imagePath: 'assets/images/maysa.jpg',
                                          contributorName: 'Maysa Jeremias',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              //Tablet
              else if (constraints.maxWidth > 600) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(26.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                              offset: const Offset(0, 10),
                              blurRadius: 10,
                            ),
                          ],
                          color: const Color.fromARGB(255, 21, 48, 66),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.98,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Text(
                                "Sobre o projeto:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Como surgiu?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "No início uma de nossas fundadoras, a Lorena, teve essa ideia apenas para ser o tema do nosso trabalho de conclusão de curso, o TCC, mas depois percebemos o quão grave é essa situação, principalmente nos dias de hoje. Então decidimos nos solidarizar e entrar mais a fundo na nossa ideia.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          Text(
                                            "Quais os objetivos?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Os objetivos do projeto é ajudar os alunos da instituição de uma forma prática e eficaz, fazendo com que não precisem procurar o coordenador acadêmico de cada campus para resolver seu problema. Além de informar sobre o assunto para todos os outros alunos, sabendo que é um tema bem recorrente na atualidade.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 26.0),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Por que escolhemos esse tema?",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "Os percentuais de problemas mentais têm crescido cada vez mais, não só em nosso país, mas no mundo todo. Segundo a Organização Mundial da Saúde (OMS), a depressão e a ansiedade aumentaram mais de 25% apenas no primeiro ano da pandemia. Pensando nisso, observamos os recentes casos de transtornos mentais no CEFET. Então desenvolvemos esse projeto para facilitar o auxílio à essas pessoas, por meio dos relatos, com o objetivo de facilitar a conversa e fornecer toda a ajuda necessária. O projeto também facilitaria o trabalho das Coordenações em observar e cuidar dos alunos.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              "Desenvolvedoras:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, left: 100.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () =>
                                            launchUrl(Uri.parse('https://www.instagram.com/mariattmedeiros_/')),
                                        child: ContributorCircleAvatar(
                                          imagePath: 'assets/images/teresa.jpg',
                                          contributorName: 'Maria Medeiros',
                                        ),
                                      ),
                                      const SizedBox(width: 60.0),
                                      GestureDetector(
                                        onTap: () => launchUrl(Uri.parse('https://www.instagram.com/blandin_lorena/')),
                                        child: ContributorCircleAvatar(
                                          imagePath: 'assets/images/blandin.jpg',
                                          contributorName: 'Lorena Blandin',
                                        ),
                                      ),
                                      const SizedBox(width: 60.0),
                                      GestureDetector(
                                        onTap: () => launchUrl(Uri.parse('https://www.instagram.com/maysaj__/')),
                                        child: ContributorCircleAvatar(
                                          imagePath: 'assets/images/maysa.jpg',
                                          contributorName: 'Maysa Jeremias',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                //Celular
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 8, 8, 24).withOpacity(0.5),
                                  offset: const Offset(0, 10),
                                  blurRadius: 10,
                                ),
                              ],
                              color: const Color.fromARGB(255, 21, 48, 66),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "Sobre o projeto:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Arial Rounded MT Bold",
                                      fontSize: 28,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Como surgiu?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: "Poppins-Bold",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Text(
                                    "No início uma de nossas fundadoras, a Lorena, teve essa ideia apenas para ser o tema do nosso trabalho de conclusão de curso, o TCC, mas depois percebemos o quão grave é essa situação, principalmente nos dias de hoje. Então decidimos nos solidarizar e entrar mais a fundo na nossa ideia.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Regular",
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Quais os objetivos?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: "Poppins-Bold",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Text(
                                    "Os objetivos do projeto é ajudar os alunos da instituição de uma forma prática e eficaz, fazendo com que não precisem procurar o coordenador acadêmico de cada campus para resolver seu problema. Além de informar sobre o assunto para todos os outros alunos, sabendo que é um tema bem recorrente na atualidade.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Regular",
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Por que escolhemos esse tema?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: "Poppins-Bold",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: const Text(
                                    " Os percentuais de problemas mentais têm crescido cada vez mais, não só em nosso país, mas no mundo todo. Segundo a Organização Mundial da Saúde (OMS). Pensando nisso, observamos os recentes casos de transtornos mentais no CEFET. Então desenvolvemos esse projeto para facilitar o auxílio à essas pessoas, por meio dos relatos, com o objetivo de facilitar a conversa e fornecer toda a ajuda necessária. O projeto também facilitaria o trabalho das Coordenações em observar e cuidar dos alunos.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins-Regular",
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Desenvolvedoras:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 24,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () => launchUrl(Uri.parse('https://www.instagram.com/mariattmedeiros_/')),
                                      child: ContributorCircleAvatar(
                                        imagePath: 'assets/images/teresa.jpg',
                                        contributorName: 'Maria Medeiros',
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => launchUrl(Uri.parse('https://www.instagram.com/blandin_lorena/')),
                                      child: ContributorCircleAvatar(
                                        imagePath: 'assets/images/blandin.jpg',
                                        contributorName: 'Lorena Blandin',
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => launchUrl(Uri.parse('https://www.instagram.com/maysaj__/')),
                                      child: ContributorCircleAvatar(
                                        imagePath: 'assets/images/maysa.jpg',
                                        contributorName: 'Maysa Jeremias',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          //Rodapé
          Padding(
            padding: const EdgeInsets.only(top: 120.0, left: 0.0),
            child: Container(
              color: Color.fromARGB(255, 24, 52, 70),
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
          )
        ],
      )),
    );
  }
}
