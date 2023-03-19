import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insurancetech/models/checagem.model.dart';
import 'package:insurancetech/pages/login.page.dart';
import 'package:insurancetech/pages/verificarEmail.page.dart';
import '../components/largeButton.dart';
import '../components/pageTitle.dart';
import'package:insurancetech/services/database.dart';


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
  bool _showPassword = true;
  bool _showconfirmPassword = true;
  final _firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          height:MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(
          top: 50,
          left: 40,
          right: 40,
        ),
        color: const Color(0xFF2a5298),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/logo.png"),
            ),
            const SizedBox(height: 40),
            const pageTitle(
              texto: 'Crie sua conta',
            ),
            const SizedBox(height: 40),
            TextFormField(
                //autofocus: true,
                controller: _nomeController,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Campo obrigatório';
                  } else {

                  }
                  return null;
                },
                onChanged: (text) {},
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  filled: true ,
                  fillColor: Colors.white12,
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
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
            ),
            const SizedBox(height: 18),
            TextFormField(
                //autofocus: true,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Informe um email!';
                  } else {

                  }
                  return null;
                },
                controller: _emailController,
                onChanged: (text) {},
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: const InputDecoration(
                  filled: true ,
                  fillColor: Colors.white12,
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
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
            ),
            const SizedBox(height: 18),
            TextFormField(
                //autofocus: true,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Informe sua senha!';
                  } else {

                  }
                  return null;
                },
                controller: _passwordController,
                onChanged: (text) {},
                keyboardType: TextInputType.text,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  filled: true ,
                  fillColor: Colors.white12,
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _showPassword == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                  labelText: "Senha",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  labelStyle: const TextStyle(
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
            const SizedBox(height: 18),
            TextFormField(
                //autofocus: true,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Confirme sua senha!';
                  } else {

                  }
                  return null;
                },
                controller: _confirmPasswordController,
                onChanged: (text) {},
                keyboardType: TextInputType.text,
                obscureText: _showconfirmPassword,
                decoration: InputDecoration(
                  filled: true ,
                  fillColor: Colors.white12,
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _showconfirmPassword == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        _showconfirmPassword = !_showconfirmPassword;
                      });
                    },
                  ),
                  labelText: "Confirmar senha",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  labelStyle: const TextStyle(
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
            const SizedBox(height: 40),
            LargeButton(
              texto: 'Cadastrar',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  cadastrar();
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text(
                //       'As senhas são diferentes.',
                //     ),
                //     backgroundColor: Colors.redAccent,
                //   ));
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: const Text(
                  "Já tenho conta!",
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
      ));
  }

  cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      userCredential.user!.updateDisplayName(_nomeController.text);

      OurDatabase().createUser(nome:_nomeController.text,email:_emailController.text);

      FirebaseFirestore.instance
          .collection('usuarios/${_emailController.text}/conta')
          .doc('informacoes')
          .set({
        'nomeUsuario': _nomeController.text,
        'email': _emailController.text,
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ChecagemPage(),
          ),
          (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado.'),
          backgroundColor: Colors.greenAccent,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha fraca. Tente novamente'),
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


class Registro extends CadastroPage {
  const Registro({super.key});
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const VerifyEmail();
            } else {
              return const LoginPage();
            }
          },
        ),
      );
}
