import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insurancetech/components/largeButton.dart';
import 'package:insurancetech/pages/home.page.dart';
import 'package:insurancetech/pages/login.page.dart';

class VerifyEmail extends StatefulWidget {
  static const routeName = '/verificaEmail';

  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    //user needs to be created before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 5),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    //call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }
  //Timer.periodic(const Duration(seconds: 3), (Timer timer) {
  //  if (isEmailVerified) {
  //   timer.cancel();
  // }
  // });

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(e.toString as SnackBar);
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const HomePage()
      : Scaffold(
          body: Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF2a5298),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text(
                      "Um e-mail de verificação foi enviado para a sua caixa de entrada",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/verificaEmail');
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LargeButton(
                  texto: 'Reenvie o e-mail de verificação',
                  onPressed: () {
                    sendVerificationEmail();
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      "VOLTAR",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                //   Column(
                //        children: [
                //        const Text('Verifique o seu e-mail'),
                //        TextButton(
                //         onPressed: () {
                //          final user = FirebaseAuth.instance.currentUser;
                //           user?.sendEmailVerification();
                //        },
                //       child: const Text('Envia email verification'),
                //     )
                //     ],
                //  ),
              ],
            ),
          ),
        );
}
