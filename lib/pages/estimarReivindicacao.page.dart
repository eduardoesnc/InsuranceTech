import 'package:flutter/material.dart';

import '../components/drawer.dart';
import '../components/largeButton.dart';
import '../components/pageTitle.dart';

class EstimarReivindicacaoPage extends StatefulWidget {
  const EstimarReivindicacaoPage({Key? key}) : super(key: key);

  static const routeName = '/estimar';

  @override
  State<EstimarReivindicacaoPage> createState() =>
      _EstimarReivindicacaoPageState();
}

class _EstimarReivindicacaoPageState extends State<EstimarReivindicacaoPage> {
  int? idadeCondutor;
  int? idadeCarro;
  String? modelo;
  String? combustivel;
  final List<String> combustiveis = ["CNG", "Diesel", "Petrol"];
  String? segmento;
  final List<String> segmentos = ["A", "B1", "B2", "C1", "C2"];
  String? opcao;
  String? opcao1;
  final List<String> opcoes = ["Sim", "Não"];
  String? tipoTransmissao;
  final List<String> tiposTransmissao = ["Automático", "Manual"];
  String? densidade;
  final List<String> densidadePopulacional = ["0 - 290 hab/km²", "291 - 3.947 hab/km²", 
  "3.948 - 7.604 hab/km²", "7.605 - 11.261 hab/km²", "11.262 - 14.918 hab/km²", "14.919 - 18.575 hab/km²", 
  "18.576 - 22.232 hab/km²", "22.233 - 29.546 hab/km²", "29.547 - 33.203 hab/km²", "33.204 - 36.860 hab/km²", 
  "36.861 - 62.459 hab/km²", "62.460 - 66.116 hab/km²", "66.117 - 69.773 hab/km²", "69.774 - 73.430 hab/km²", 
  "Mais de 73.430 hab/km²"];
  bool salvarInfo = false;

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
            const SizedBox(height: 50),
            const pageTitle(
              texto: 'Informe os dados',
            ),
            const SizedBox(height: 50),

            //Box do nome para identificação
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {},
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Nome para identificação *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
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
            const SizedBox(height: 20),

            //Box da idade do condutor
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<int>(
                value: idadeCondutor,
                onChanged: (int? value) {
                  setState(() {
                    idadeCondutor = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Idade do condutor *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return List.generate(
                    83,
                    (index) {
                      final value = index + 18;
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "$value",
                          style: TextStyle(
                            fontSize: 18,
                            color: value == idadeCondutor
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                },
                items: List.generate(
                  83,
                  (index) => DropdownMenuItem<int>(
                    value: index + 18,
                    child: Text(
                      "${index + 18}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box da idade do carro
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<int>(
                value: idadeCarro,
                onChanged: (int? value) {
                  setState(() {
                    idadeCarro = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Idade do carro *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return List.generate(
                    40,
                    (index) {
                      final value = index + 1;
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "$value",
                          style: TextStyle(
                            fontSize: 18,
                            color: value == idadeCarro
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                },
                items: List.generate(
                  40,
                  (index) => DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box do modelo do carro
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: modelo,
                onChanged: (String? value) {
                  setState(() {
                    modelo = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Modelo do carro *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return List.generate(
                    11,
                    (index) {
                      final value = "M${index + 1}";
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                value == modelo ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                },
                items: List.generate(
                  11,
                  (index) => DropdownMenuItem<String>(
                    value: "M${index + 1}",
                    child: Text(
                      "M${index + 1}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box do tipo do combustível
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: combustivel,
                onChanged: (String? value) {
                  setState(() {
                    combustivel = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Tipo de combustível *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return combustiveis.map(
                    (value) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color: value == combustivel
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList();
                },
                items: combustiveis.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box do segmento do carro
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: segmento,
                onChanged: (String? value) {
                  setState(() {
                    segmento = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Segmento do carro *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return segmentos.map(
                    (value) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                value == segmento ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList();
                },
                items: segmentos.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box da assistência de freio
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: opcao,
                onChanged: (String? value) {
                  setState(() {
                    opcao = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Tem assistência de freio? *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return opcoes.map(
                    (value) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color: value == opcao ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList();
                },
                items: opcoes.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box da câmera de ré
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: opcao1,
                onChanged: (String? value) {
                  setState(() {
                    opcao1 = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Tem câmera de ré? *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return opcoes.map(
                    (value) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                value == opcao1 ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList();
                },
                items: opcoes.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box do tipo de transmissão
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: tipoTransmissao,
                onChanged: (String? value) {
                  setState(() {
                    tipoTransmissao = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Tipo de transmissão *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return tiposTransmissao.map(
                    (value) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                value == tipoTransmissao ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList();
                },
                items: tiposTransmissao.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box da densidade populacional
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: densidade,
                onChanged: (String? value) {
                  setState(() {
                    densidade = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Densidade populacional de seu município *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return densidadePopulacional.map(
                    (value) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 18,
                            color:
                                value == densidade ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  ).toList();
                },
                items: densidadePopulacional.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                menuMaxHeight: 360,
                borderRadius: BorderRadius.circular(10),
                iconSize: 27,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            //Box do Bairro/Cidade
            Container(
              height: 54,
              decoration: const BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {},
                //autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Bairro/Cidade *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
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
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
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
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 30,
                        child: Icon(
                          salvarInfo
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: salvarInfo ? Colors.green : Colors.black,
                          semanticLabel: salvarInfo
                              ? 'Não salvar informações'
                              : 'Salvar informações',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LargeButton(
              texto: 'Enviar',
              onPressed: () {
                Navigator.of(context).pushNamed('/resultado');
              },
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
