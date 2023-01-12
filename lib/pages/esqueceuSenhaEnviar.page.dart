//1* - FALTA CRIAR A NOTIFICAÇÃO DE QUE O EMAIL FOI ENVIADO COM SUCESSO

import 'package:flutter/material.dart';

class EsqueceuSenhaPage extends StatefulWidget {
  const EsqueceuSenhaPage({Key? key}) : super(key: key);

  @override
  State<EsqueceuSenhaPage> createState() => _EsqueceuSenhaPage();
}

class _EsqueceuSenhaPage extends State<EsqueceuSenhaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 60, left: 40, right: 40,),
          color: Color(0xFF2a5298),
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset("assets/logo.png"),
              ),
              SizedBox( height: 60 ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox( height: 60 ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Digite seu email para enviarmos uma nova senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox( height: 60 ),
              Container(
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),

                ),
                child: TextFormField(
                  //autofocus: true,
                  onChanged: (text){},
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Email",
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
              SizedBox( height: 60 ),
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
                      //1*
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Enviar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}