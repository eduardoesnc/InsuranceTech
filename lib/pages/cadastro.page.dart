import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insurancetech/models/checagem.page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  static const routeName = '/cadastro';

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Color(0xFF2a5298),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Crie sua conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
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
                controller: _nomeController,
                onChanged: (text) {},
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: "Usuário",
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
            SizedBox(height: 18),
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
                controller: _emailController,
                onChanged: (text) {},
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
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
            SizedBox(height: 18),
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
                controller: _passwordController,
                onChanged: (text) {},
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
            SizedBox(height: 18),
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
                controller: _confirmPasswordController,
                onChanged: (text) {},
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmar senha",
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
            SizedBox(height: 40),
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
                    if (_confirmPasswordController.text == _passwordController.text) {
                      cadastrar();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'As senhas são diferentes.',
                        ),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cadastrar",
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
            SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Text(
                  "Já tenho conta.",
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

  cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nomeController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ChecagemPage(),
            ),
            (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cadastro realizado.'),
            backgroundColor: Colors.greenAccent,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mais forte'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email já foi cadastrado'),
          ),
        );
      }
    }
  }


}
