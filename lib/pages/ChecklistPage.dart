import 'package:flutter/material.dart';

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<String> _documentList = [    'RG',    'CPF',    'Comprovante de residência',    'Boletim de ocorrência',    'Laudo médico',    'Orçamento de reparo',  ];
  List<bool> _checkedList = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentos necessários'),
      ),
      body: ListView.builder(
        itemCount: _documentList.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(_documentList[index]),
            value: _checkedList[index],
            onChanged: (bool value) {
              setState(() {
                _checkedList[index] = value;
              });
            },
          );
        },
      ),
    );
  }
}