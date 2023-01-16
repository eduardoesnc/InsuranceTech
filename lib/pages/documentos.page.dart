import 'package:flutter/material.dart';


class DocumentosPage extends StatefulWidget {
  const DocumentosPage({Key? key}) : super(key: key);

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {

  var saved = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 260,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,0),
          child: Column(
            children: [
              ListTile(
                title: Text("Home"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
              ListTile(
                title: Text("Estimar reivindicação"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/estimar');
                },
              ),
              ListTile(
                title: Text("Análises sobre seguros"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
              ListTile(
                title: Text("Carros salvos"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/carrosSalvos');
                },
              ),
              ListTile(
                title: Text("Documentos necessários"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/documentos');
                },
              ),
              ListTile(
                title: Text("Sobre"),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/sobre');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2a5298),
        centerTitle: true,
        title: SizedBox(
          width: 90,
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Color(0xFF2a5298),
        child: ListView(
          children: <Widget>[
            SizedBox( height: 50 ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Documentos necessários para reivindicar o seguro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox( height: 50 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                          if (saved.contains('rg')){
                              saved.remove('rg');
                          } else {
                            saved.add('rg');
                          }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RG',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('rg')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('rg')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('rg')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('cpf')){
                          saved.remove('cpf');
                        } else {
                          saved.add('cpf');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CPF',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('cpf')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('cpf')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('cpf')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('cr')){
                          saved.remove('cr');
                        } else {
                          saved.add('cr');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Comprovante de residência',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('cr')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('cr')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('cr')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('ch')){
                          saved.remove('ch');
                        } else {
                          saved.add('ch');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Carteira de habilitação',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('ch')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('ch')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('ch')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('bo')){
                          saved.remove('bo');
                        } else {
                          saved.add('bo');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Boletim de ocorrência',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('bo')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('bo')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('bo')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('pm')){
                          saved.remove('pm');
                        } else {
                          saved.add('pm');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Prontuário médico',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('pm')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('pm')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('pm')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('dc')){
                          saved.remove('dc');
                        } else {
                          saved.add('dc');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Documento do carro',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('dc')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('dc')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('dc')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('dcv')){
                          saved.remove('dcv');
                        } else {
                          saved.add('dcv');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Documento compra e venda',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('dcv')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('dcv')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('dcv')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        if (saved.contains('dpo')){
                          saved.remove('dpo');
                        } else {
                          saved.add('dpo');
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Documento porte obrigatório',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 5,),
                        SizedBox(
                          width: 30,
                          child: Icon(
                            (saved.contains('dpo')) ? Icons.check_box : Icons.check_box_outline_blank,
                            color: (saved.contains('dpo')) ? Colors.green : Colors.black,
                            semanticLabel: (saved.contains('dpo')) ? 'Desmarcar' : 'Marcar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}