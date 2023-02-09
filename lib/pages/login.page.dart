import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insurancetech/components/largeButton.dart';
import 'package:insurancetech/pages/cadastro.page.dart';
import 'package:insurancetech/pages/home.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
        ),
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
                controller: _emailcontroller,
                //autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
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
                controller: _passwordcontroller,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
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
                login();
                if (_emailcontroller.text == 'teste' &&
                    _passwordcontroller.text == '123') {
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroPage()
                    ),
                  );
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

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
      );
      if (UserCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logado'),
            backgroundColor: Colors.greenAccent,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário não encontrado. Cadastre-se.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Senha incorreta.'),
              backgroundColor: Colors.redAccent,
            ),
        );
      }
    }
  }
}
