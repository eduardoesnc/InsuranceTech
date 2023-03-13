import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';
import '../components/pageTitle.dart';
import '../models/Analises.model.dart';

class AnalisePage extends StatefulWidget {
  const AnalisePage({Key? key}) : super(key: key);

  static const routeName = '/analise';

  @override
  State<AnalisePage> createState() => _AnalisePageState();
}

class _AnalisePageState extends State<AnalisePage> {

  final List<Analise> analises = [
    const Analise('assets/analises/ncap-x-claim.png', 'A análise da porcentagem da classificação de segurança pela NCAP entre os carros com chance de reivindicar o seguro é importante para as seguradoras avaliarem o grau de segurança dos veículos de maior risco e estabelecer critérios mais rigorosos para aceitação de seguros. Também incentiva a escolha de modelos mais seguros pelos clientes, visando a redução dos sinistros e dos preços das apólices.'),
    const Analise('assets/analises/segmento-x-claim.png', 'A análise de probabilidade de sinistro por tipo de veículo é importante para as seguradoras, pois permite avaliar o risco de acidentes envolvendo diferentes tipos de veículos e, consequentemente, estabelecer os preços das apólices de seguro de forma mais justa e equilibrada. Além disso, essa análise também pode ajudar a identificar possíveis problemas de segurança em determinados modelos de veículos e, assim, incentivar melhorias na fabricação de carros mais seguros.'),
    const Analise('assets/analises/agesegurado-x-claim.png', 'A análise de dispersão da probabilidade de sinistro pela idade do motorista é importante para as seguradoras definirem preços adequados para as apólices de seguro e estabelecer políticas de prevenção de acidentes. A análise também pode ajudar na criação de programas educacionais para um comportamento mais seguro no trânsito.'),
    const Analise('assets/analises/agesegurado-x-agecarro.png', 'A análise da dispersão entre a idade do segurado e a idade do carro é importante porque permite entender a relação entre essas variáveis e identificar se há uma tendência de acidentes com carros mais antigos conduzidos por motoristas mais jovens. Essa análise auxilia na avaliação do risco de sinistros em carros mais antigos e ajuda a definir políticas mais efetivas de renovação da frota e manutenção preventiva.'),
    const Analise('assets/analises/combustivel-x-segurado.png', 'Essa análise é importante para as seguradoras entenderem o perfil dos veículos que estão sendo segurados e as tendências de mercado em relação aos tipos de combustível mais utilizados. Isso pode ajudar a definir preços mais adequados para as apólices de seguro, bem como a criar políticas e estratégias para incentivar a adoção de veículos mais sustentáveis e econômicos em termos de combustível.'),
    const Analise('assets/analises/distribuicao-geografica.png', 'A análise da distribuição geográfica dos segurados permite que as seguradoras entendam as características de cada região, como índices de criminalidade e acidentes de trânsito, para ajustar preços e coberturas de seguro de acordo com o perfil de risco. Também ajuda a desenvolver estratégias de marketing e atendimento personalizadas para cada localidade.'),
    const Analise('assets/analises/densidade-x-area.png', 'A análise da relação entre densidade populacional e área do segurado pode ser importante para as seguradoras ajustarem preços e coberturas de acordo com o perfil de risco de cada área, além de contribuir para a prevenção de acidentes e roubo de veículos em áreas de maior risco. Essa análise pode ser útil para entender a demanda por seguros em diferentes áreas geográficas e as possíveis influências dessas variáveis no risco de sinistro.'),
    const Analise('assets/analises/agecarro-x-combustivel.png', 'Essa análise é importante para entender a relação entre a idade do carro e o tipo de combustível e como isso afeta o risco de acidentes e o desempenho do veículo. As seguradoras podem usar essas informações para ajustar preços e coberturas de seguro e incentivar o uso de combustíveis mais eficientes e sustentáveis'),

  ];

  final Analise analise = const Analise('', '');

  late TextEditingController controller;
  late FixedExtentScrollController scrollController;

  final titulo = [
    'Classificação de segurança pela NCAP entre os carros com chance de reivindicar o seguro',
    'Probabilidade de Sinistro por Segmento do Veículo',
    'Probabilidade de Sinistro pela Idade do Motorista',
    'Dispersão entre a idade do segurado e a idade do carro',
    'Tipo de combustível usado pelos carros segurados',
    'Distribuição geográfica dos segurados:',
    'Relação entre a densidade populacional e a área do segurado',
    'Relação entre idade do carro e tipo de combustível',
  ];

  int index = 0;

  @override
  void initState(){
    super.initState();


    scrollController = FixedExtentScrollController(initialItem: index);
  }

  @override
  void dispose(){
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Analise analise = analises[index];
    final String urlImg = analise.img;
    final String texto = analise.texto;

    void showFullscreenImage(BuildContext context) {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    color: const Color(0xFF2a5298),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        urlImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

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
            const SizedBox( height: 50 ),

            const pageTitle(texto: 'Análises Gráficas',),

            const SizedBox( height: 50 ),

            Container(
              height: 54,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white12,
                border: Border.all(width: 1, color: Colors.black38),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: (){
                    scrollController.dispose();
                    scrollController = FixedExtentScrollController(initialItem: index);
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          actions: [buildPicker()],
                          cancelButton: CupertinoActionSheetAction(
                            child: const Text('Cancelar'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Escolha uma análise para visualizar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white54, size: 35,),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40,),

            Text(
              titulo[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40,),

            GestureDetector(
              onTap: () {
                showFullscreenImage(context);
              },
              child: Image.asset(urlImg),
            ),

            const SizedBox(height: 20,),

            Text(
              texto,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),

            const SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }

  Widget buildPicker() => SizedBox(
    height: 350,
    child:
        CupertinoPicker(
          scrollController: scrollController,
          looping: true,
          itemExtent: 80,
          selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
            background: Color(0x8A2a5298),
          ),
          children: List.generate(titulo.length, (index) {
            final item = titulo[index];
            return Center(
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
            );
          }),
          onSelectedItemChanged: (index){
            setState(() {
              this.index = index;
            });
          },
        ),
  );

}