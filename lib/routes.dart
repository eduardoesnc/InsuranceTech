import 'package:flutter/material.dart';
import 'package:insurancetech/pages/login.page.dart';
import 'package:insurancetech/pages/esqueceuSenha.page.dart';
import 'package:insurancetech/pages/cadastro.page.dart';
import 'package:insurancetech/pages/perfil.page.dart';
import 'package:insurancetech/pages/home.page.dart';
import 'package:insurancetech/pages/estimarReivindicacao.page.dart';
import 'package:insurancetech/pages/resultadoEstimativa.page.dart';
import 'package:insurancetech/pages/sobre.page.dart';
import 'package:insurancetech/pages/sugestoes.page.dart';
import 'package:insurancetech/pages/carrosSalvos.page.dart';
import 'package:insurancetech/pages/documentos.page.dart';
import 'package:insurancetech/models/checagem.model.dart';
import 'package:insurancetech/pages/analises.page.dart';
import 'package:insurancetech/pages/webview.page.dart';
import 'package:insurancetech/pages/mapa.page.dart';
import 'package:insurancetech/pages/coordenadas.page.dart';

Map<String, Widget Function(dynamic)> instanceRoutes(BuildContext context) => {
      ChecagemPage.routeName: (context) => const ChecagemPage(),
      LoginPage.routeName: (context) => const LoginPage(),
      CadastroPage.routeName: (context) => const CadastroPage(),
      EsqueceuSenhaPage.routeName: (context) => const EsqueceuSenhaPage(),
      HomePage.routeName: (context) => const HomePage(),
      EstimarReivindicacaoPage.routeName: (context) =>
          const EstimarReivindicacaoPage(),
      ResultadoEstimativaPage.routeName: (context) =>
          const ResultadoEstimativaPage(),
      SobrePage.routeName: (context) => const SobrePage(),
      EnvioSugestoes.routeName: (context) => const EnvioSugestoes(),
      CarrosSalvosPage.routeName: (context) => const CarrosSalvosPage(),
      DocumentosPage.routeName: (context) => const DocumentosPage(),
      EditarPerfilPage.routeName: (context) => const EditarPerfilPage(),
      AnalisePage.routeName: (context) => const AnalisePage(),
      WebAppPage.routeName: (context) => const WebAppPage(),
      MapaPage.routeName: (context) => const MapaPage(),
      CoordenadasPage.routeName: (context) => const CoordenadasPage(),
    };
