import 'package:flutter/material.dart';

class EstimarReivindicacaoPage extends StatefulWidget {
  const EstimarReivindicacaoPage({Key? key}) : super(key: key);

  @override
  State<EstimarReivindicacaoPage> createState() => _EstimarReivindicacaoPageState();
}

class _EstimarReivindicacaoPageState extends State<EstimarReivindicacaoPage> {

  bool salvarInfo = false;

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
                'Informe os dados',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox( height: 50 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Nome para identificação *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Idade do condutor *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Idade do carro *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Modelo do carro *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Tipo de combustivel *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Segmento do carro *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Tem assistência de freio? *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Tem câmera de ré? *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Tipo de transmissão *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Densidade populacional *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox( height: 20 ),
            Container(
              height: 54,
              decoration: BoxDecoration(
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
                decoration: InputDecoration(
                  labelText: "Bairro/Cidade *",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8),),),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '* Campos obrigatórios',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20,),
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
                      Text(
                        'Salvar informações',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 5,),
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
            SizedBox(height: 20,),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/resultado');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Enviar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
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