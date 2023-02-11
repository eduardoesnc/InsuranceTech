import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insurancetech/pages/home.page.dart';
import 'package:insurancetech/pages/login.page.dart';

class ChecagemPage extends StatefulWidget{
  const ChecagemPage({Key? key}) : super (key:key);

  static const routeName = '/checar';

  @override
  State<ChecagemPage> createState() => _ChecagemPageState();
}

class _ChecagemPageState extends State<ChecagemPage> {

  StreamSubscription? streamSubscription;

  @override
  initState(){
    super.initState();
    streamSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
     if (user == null) {
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => const LoginPage()
           ),
       );
     } else {
       var pushReplacement = Navigator.pushReplacement(
         context,
         MaterialPageRoute(
             builder: (context) => const HomePage(),
         ));
     }
    });
  }

  @override
  void dispose(){
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}