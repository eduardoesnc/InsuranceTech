import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';
import 'package:insurancetech/components/largeButton.dart';

class SugestoesPage extends StatefulWidget {
  const SugestoesPage({Key? key}) : super(key: key);

  static const routeName = '/sugestoes';

  @override
  State<SugestoesPage> createState() => _SugestoesPageState();
}

class _SugestoesPageState extends State<SugestoesPage> {


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
            SizedBox( height: 50 ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Envie-nos sugestões',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox( height: 50 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome*",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Email*",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Assunto*",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                textAlign: TextAlign.start,
                onChanged: (text) {

                },
                //autofocus: true,
                textAlignVertical: TextAlignVertical.top,

                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  labelText: "Mensagem*",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,

                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '* Campos obrigatórios',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20,),

            LargeButton(
                texto: 'Enviar',
                onPressed: () {

                },
            ),

            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}