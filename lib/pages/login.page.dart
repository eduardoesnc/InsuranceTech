import 'package:flutter/material.dart';
import 'package:insurancetech/components/largeButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 80, left: 40, right: 40,),
          color: Color(0xFF2a5298),
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/logo.png"),
              ),
              SizedBox(
                height: 80,
              ),
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
                    username = text;
                  },
                  //autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Usuário",
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
              SizedBox(
                height: 20,
              ),
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
                  onChanged: (text) {
                    password = text;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
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
              SizedBox(
                height: 40,
              ),
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                child: TextButton(
                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/esqueceuSenhaEnviar');
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),

              LargeButton(
                  texto: 'Login',
                  onPressed: () {
                    if(username == 'teste' && password == '123'){
                      print('Logado com sucesso');
                      Navigator.of(context).pushReplacementNamed('/home');
                    }
                  },
              ),

              SizedBox(
                height: 40,
              ),
              Container(
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastro');
                  },
                  child: Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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