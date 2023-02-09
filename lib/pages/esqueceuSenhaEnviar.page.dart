//1* - FALTA CRIAR A NOTIFICAÇÃO DE QUE O EMAIL FOI ENVIADO COM SUCESSO

import 'package:flutter/material.dart';

import '../components/largeButton.dart';

class EsqueceuSenhaPage extends StatefulWidget {
  const EsqueceuSenhaPage({Key? key}) : super(key: key);

  static const routeName = '/esqueceuSenhaEnviar';

  @override
  State<EsqueceuSenhaPage> createState() => _EsqueceuSenhaPageState();
}

class _EsqueceuSenhaPageState extends State<EsqueceuSenhaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 60, left: 40, right: 40,),
          color: const Color(0xFF2a5298),
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset("assets/logo.png"),
              ),
              const SizedBox( height: 60 ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox( height: 60 ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Digite seu email para enviarmos uma nova senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox( height: 60 ),
              Container(
                height: 54,
                decoration: const BoxDecoration(
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
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox( height: 60 ),

              LargeButton(
                texto: 'Enviar',
                onPressed: () {
                  //1*
                },
              ),

            ],
          ),
        ),
    );
  }
}