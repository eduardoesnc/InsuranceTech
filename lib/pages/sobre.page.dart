import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  static const routeName = '/sobre';

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
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
            SizedBox( height: 25 ),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sobre',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Donec nec mauris elit. Morbi in bibendum quam. Vivamus '
                        'ac interdum ligula, egestas convallis ex. Mauris posuere'
                        ' enim sed congue maximus. Curabitur at tempus orci, non'
                        ' lacinia eros. Donec nunc turpis, euismod eget dolor '
                        'aliquam, posuere faucibus turpis. Donec et semper ex. ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Nós realizamos estimativas!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Donec nec mauris elit. Morbi in bibendum quam. Vivamus '
                        'ac interdum ligula, egestas convallis ex.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Tecnologias utilizadas',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Flutter: Lorem ipsum dolor sit amet, consectetur adipiscing'
                        ' elit. Donec nec mauris elit. Morbi in bibendum quam.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Python: Lorem ipsum dolor sit amet, consectetur adipiscing '
                        'elit. Donec nec mauris elit. Morbi in bibendum quam.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'MySQL: Lorem ipsum dolor sit amet, consectetur adipiscing '
                        'elit. Donec nec mauris elit. Morbi in bibendum quam.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Streamlit: Lorem ipsum dolor sit amet, consectetur adipiscing'
                        ' elit. Donec nec mauris elit. Morbi in bibendum quam.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    child: SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/sugestoes');
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Icon(
                                Icons.mail_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'Envie-nos sugestões',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}