import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';
import '../components/pageTitle.dart';

class AnalisePage extends StatefulWidget {
  const AnalisePage({Key? key}) : super(key: key);

  static const routeName = '/analise';

  @override
  State<AnalisePage> createState() => _AnalisePageState();
}

class _AnalisePageState extends State<AnalisePage> {

  final String titulo = '';
  final String texto = 'Escolha uma análise para visualizar';
  final String urlImg = 'assets/img-teste.png';

  late TextEditingController controller;
  late FixedExtentScrollController scrollController;
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
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

            const SizedBox(height: 20,),

            const SizedBox(height: 20,),

            Image.asset('assets/img-teste.png'),

            const SizedBox(height: 20,),

            Text(
              items[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20,),

            Text(
              'Texto do item ${items[index]} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec'
                  ' nisl mi. Morbi laoreet dui nec nunc luctus, vel volutpat elit'
                  ' cursus. Vestibulum a eros vestibulum, ullamcorper diam ac,'
                  ' pellentesque libero.',
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),

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
          itemExtent: 64,
          selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
            background: Color(0x8A2a5298),
          ),
          children: List.generate(items.length, (index) {
            final item = items[index];

            return Center(
              child: Text(
                item,
                style: const TextStyle(fontSize: 20, color: Colors.black),
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