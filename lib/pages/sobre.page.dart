import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  static const routeName = '/sobre';

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFF2a5298),
        centerTitle: true,
        title: SizedBox(
          width: 90,
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        color: const Color(0xFF2a5298),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Sobre',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    """Bem-vindo ao nosso aplicativo! Nós somos um grupo de estudantes da UFRPE que desenvolveu um aplicativo de previsão de reivindicação de seguro automotivo nos próximos seis meses usando o conjunto de dados Car Insurance Claim Prediction. O objetivo do aplicativo é ajudar os usuários a tomar decisões informadas sobre a contratação e renovação de seus seguros, fornecendo informações precisas sobre os fatores que influenciam a probabilidade de reivindicação.

Além de beneficiar os usuários, nosso aplicativo também contribui para a área de análise de dados e machine learning por meio da aplicação dessas técnicas em um contexto real. Estamos sempre abertos a comentários e sugestões para melhorar nosso trabalho e agradecemos pelo interesse em nosso aplicativo.""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Nós realizamos estimativas!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    """As informações do nosso aplicativo são baseadas apenas no conjunto de dados Car Insurance Claim Prediction, e por isso, são apenas estimativas. Embora tenhamos usado técnicas de análise de dados e machine learning para criar o aplicativo e tentado garantir a precisão das informações, não podemos garantir sua veracidade ou exatidão. Os usuários devem sempre consultar profissionais antes de tomar decisões importantes sobre seus seguros automotivos.""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Tecnologias utilizadas',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    """Flutter: Todo nosso aplicativo foi desenvolvido utilizando o framework Flutter, que é uma tecnologia de código aberto criada pelo Google para construção de aplicativos móveis de alta performance.""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    """Firebase: Utilizamos o Firebase como banco de dados para armazenar e gerenciar todas as informações do nosso aplicativo.""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    """Python: Utilizamos a linguagem de programação Python para fazer o tratamento e análise do conjunto de dados Car Insurance Claim Prediction, além de desenvolver as técnicas de Machine Learning utilizadas em nosso aplicativo.""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    """Streamlit: Desenvolvemos um dashboard com Streamlit para exibir tratamento e análise de dados no nosso aplicativo. Essa tecnologia open-source facilitou a criação de uma interface intuitiva e interativa para os usuários explorarem a análise de dados.""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/sugestoes');
                        },
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 30,
                              child: Icon(
                                Icons.mail_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Envie-nos sugestões',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
