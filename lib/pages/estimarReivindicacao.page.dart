import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';

import 'package:insurancetech/components/drawer.dart';
import 'package:insurancetech/components/largeButton.dart';


class EstimarReivindicacaoPage extends StatefulWidget {
  const EstimarReivindicacaoPage({Key? key}) : super(key: key);

  static const routeName = '/estimar';

  @override
  State<EstimarReivindicacaoPage> createState() => _EstimarReivindicacaoPageState();
}

class _EstimarReivindicacaoPageState extends State<EstimarReivindicacaoPage> {

  bool salvarInfo = false;

  final countryList = [
    Text('Algeria 🇩🇿'),
    Text('Maroco 🇲🇦'),
    Text('Tunisia 🇹🇳'),
    Text('Palestine 🇵🇸'),
    Text('Egypt 🇪🇬'),
    Text('Syria 🇸🇾'),
    Text('Irak 🇮🇶'),
    Text('Mauritania 🇲🇷')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
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
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Informe os dados',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox( height: 50 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Nome para identificação *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Idade do condutor *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Idade do carro *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Modelo do carro *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Tipo de combustivel *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Segmento do carro *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Tem assistência de freio? *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Tem câmera de ré? *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Tipo de transmissão *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Densidade populacional *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {

                },
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Bairro/Cidade *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
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
            ),
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                '* Campos obrigatórios',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 40,
              child: SizedBox(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                        salvarInfo = !salvarInfo;
                    });
                  },
                  child: Row(
                    children: [
                      const Text(
                        'Salvar informações',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      SizedBox(
                        width: 30,
                        child: Icon(
                          salvarInfo ? Icons.check_box : Icons.check_box_outline_blank,
                          color: salvarInfo ? Colors.green : Colors.black,
                          semanticLabel: salvarInfo ? 'Não salvar informações' : 'Salvar informações',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),

            LargeButton(
                texto: 'Enviar',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/resultado');
                },
            ),


            const SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _openSimpleItemPicker(context, countryList, 'Densidade populacional');
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Densidade populacional *',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(Icons.arrow_drop_down, color: Colors.white, size: 30,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),


        ],
        ),
      ),
    );
  }
}

_openSimpleItemPicker(BuildContext context, List<Text> items, title) {
  BottomPicker(
    items: items,
    title: title,
    titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    backgroundColor: Colors.white,
    bottomPickerTheme: BottomPickerTheme.temptingAzure,
    onSubmit: (index) {
      return (index);
    },
    buttonAlignement: MainAxisAlignment.center,
    displayButtonIcon: true,
    displaySubmitButton: true,
  ).show(context);
}