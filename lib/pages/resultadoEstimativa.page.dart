import 'package:flutter/material.dart';

class ResultadoEstimativaPage extends StatefulWidget {
  const ResultadoEstimativaPage({Key? key}) : super(key: key);

  static const routeName = '/resultado';

  @override
  State<ResultadoEstimativaPage> createState() => _ResultadoEstimativaPageState();
}

class _ResultadoEstimativaPageState extends State<ResultadoEstimativaPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 260,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,0),
          child: Column(
            children: [
              ListTile(
                title: Text("Home"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
              ListTile(
                title: Text("Estimar reivindicação"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/estimar');
                },
              ),
              ListTile(
                title: Text("Análises sobre seguros"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
              ListTile(
                title: Text("Carros salvos"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/carrosSalvos');
                },
              ),
              ListTile(
                title: Text("Documentos necessários"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/documentos');
                },
              ),
              ListTile(
                title: Text("Sobre"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/sobre');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2a5298),
        centerTitle: true,
        title: SizedBox(
          width: 90,
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Color(0xFF2a5298),
        child: ListView(
          children: <Widget>[
            SizedBox( height: 50 ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Estimativa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox( height: 50 ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Grande Chance',
                style: TextStyle(
                  color: Color(0xFFF14835),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox( height: 50 ),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Motivos:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    //textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum: dolor sit amet, consectetur adipiscing elit. Praesent ut lectus velit.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Retornar para página inicial",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}