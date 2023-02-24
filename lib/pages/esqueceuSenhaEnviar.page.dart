//1* - FALTA CRIAR A NOTIFICAÇÃO DE QUE O EMAIL FOI ENVIADO COM SUCESSO

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/largeButton.dart';
import '../components/pageTitle.dart';
import 'package:email_validator/email_validator.dart';


class EsqueceuSenhaPage extends StatefulWidget {
  const EsqueceuSenhaPage({Key? key}) : super(key: key);

  static const routeName = '/esqueceuSenhaEnviar';

  @override
  State<EsqueceuSenhaPage> createState() => _EsqueceuSenhaPageState();
}

class _EsqueceuSenhaPageState extends State<EsqueceuSenhaPage> {
  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email enviado. Verifique sua caixa de entrada e spam'),
          backgroundColor: Colors.blueAccent,
        ),
      );
      Navigator.of(context).pushNamed('/');
        } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
          content: Text('Email não cadastrado'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

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

              const pageTitle(texto: 'Esqueceu sua senha?',),

              const SizedBox( height: 60 ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Digite o email cadastrado',
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
                  controller: _emailController,
                  onChanged: (text){},
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Digite um email válido'
                        : null,
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
                  resetPassword();
                },
              ),

            ],
          ),
        ),
    );

  }
}