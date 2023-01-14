import 'package:flutter/material.dart';
import 'package:insurancetech/pages/login.page.dart';
import 'package:insurancetech/pages/esqueceuSenhaEnviar.page.dart';
import 'package:insurancetech/pages/cadastro.page.dart';
import 'package:insurancetech/pages/redefinirSenha.page.dart';
import 'package:insurancetech/pages/home.page.dart';
import 'package:insurancetech/pages/estimarReivindicacao.page.dart';
import 'package:insurancetech/pages/resultadoEstimativa.page.dart';
import 'package:insurancetech/pages/sobre.page.dart';
import 'package:insurancetech/pages/sugestoes.page.dart';
import 'package:insurancetech/pages/carrosSalvos.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insurance Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/esqueceuSenhaEnviar': (context) => EsqueceuSenhaPage(),
        '/redefinirSenha': (context) => RedefinirSenhaPage(),
        '/home': (context) => HomePage(),
        '/estimar': (context) => EstimarReivindicacaoPage(),
        '/resultado': (context) => ResultadoEstimativaPage(),
        '/sobre': (context) => SobrePage(),
        '/sugestoes': (context) => SugestoesPage(),
        '/carrosSalvos': (context) => CarrosSalvosPage(),
      },
    );
  }
}

