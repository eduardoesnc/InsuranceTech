import 'package:flutter/material.dart';

import 'package:insurancetech/components/drawer.dart';

import '../components/pageTitle.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentosPage extends StatefulWidget {
  const DocumentosPage({Key? key}) : super(key: key);

  static const routeName = '/documentos';

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  List<File> selectedFiles = [];

  Future<void> _uploadFile(File file) async {
    // Cria uma referência ao arquivo no Firebase Storage
    Reference storageReference = storage.ref().child("uploads/${file.path.split('/').last}");
    // Upload do arquivo para o Firebase Storage
    UploadTask uploadTask = storageReference.putFile(file);
    await uploadTask.whenComplete(() => null);
    // Obtenção da URL de download do arquivo
    String downloadUrl = await storageReference.getDownloadURL();
    // Adiciona um novo documento com as informações do arquivo no Firestore
    await firestore.collection('Documentos').add({
      'nome': file.path.split('/').last,
      'url': downloadUrl,
    });
    // Atualiza a lista de arquivos carregados
    setState(() {
      selectedFiles.add(file);
    });
  }

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      _uploadFile(file);
    }
  }

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
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            const pageTitle(texto: 'Documentos necessários para reivindicar o seguro'),
            const SizedBox(height: 50),
            // Container(
            //   height: 50,
            //   alignment: Alignment.centerLeft,
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     // const Text(texto: 'RG'),
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(5),
            //     ),
            //   ),
            // ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('Documentos').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: documents.length + 2, // Adiciona 1 ao tamanho para incluir a tag
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "RG",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        );
                      } else if (index == 1) {
                        return ListTile(
                          title: const Text('Adicionar novo documento'),
                          onTap: _selectFile,
                        );
                      }
                      QueryDocumentSnapshot document = documents[index - 2];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.file_copy),
                          title: Text(document['nome']),
                          subtitle: Text(document['url']),
                          onTap: () async {
                            // Abre a URL de download do arquivo no navegador
                            await canLaunchUrl(document['url'])
                              ? await launchUrl(document['url'])
                              : throw 'Could not launch ${document['url']}';
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),

    ])));
  }
}

//   var saved = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const AppDrawer(),
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 0,
//         backgroundColor: const Color(0xFF2a5298),
//         centerTitle: true,
//         title: SizedBox(
//           width: 90,
//           child: Image.asset("assets/logo.png"),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
//         color: const Color(0xFF2a5298),
//         child: ListView(
//           children: <Widget>[
//             const SizedBox( height: 50 ),

//             const pageTitle(texto: 'Documentos necessários para reivindicar o seguro',),

//             const SizedBox( height: 50 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                           if (saved.contains('rg')){
//                               saved.remove('rg');
//                           } else {
//                             saved.add('rg');
//                           }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'RG',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('rg')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('rg')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('rg')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('cpf')){
//                           saved.remove('cpf');
//                         } else {
//                           saved.add('cpf');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'CPF',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('cpf')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('cpf')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('cpf')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('cr')){
//                           saved.remove('cr');
//                         } else {
//                           saved.add('cr');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Comprovante de residência',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('cr')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('cr')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('cr')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('ch')){
//                           saved.remove('ch');
//                         } else {
//                           saved.add('ch');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Carteira de habilitação',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('ch')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('ch')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('ch')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('bo')){
//                           saved.remove('bo');
//                         } else {
//                           saved.add('bo');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Boletim de ocorrência',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('bo')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('bo')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('bo')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('pm')){
//                           saved.remove('pm');
//                         } else {
//                           saved.add('pm');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Prontuário médico',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('pm')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('pm')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('pm')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('dc')){
//                           saved.remove('dc');
//                         } else {
//                           saved.add('dc');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Documento do carro',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('dc')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('dc')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('dc')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('dcv')){
//                           saved.remove('dcv');
//                         } else {
//                           saved.add('dcv');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Documento compra e venda',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('dcv')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('dcv')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('dcv')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox( height: 20 ),
//             Container(
//               height: 50,
//               alignment: Alignment.centerLeft,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox.expand(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         if (saved.contains('dpo')){
//                           saved.remove('dpo');
//                         } else {
//                           saved.add('dpo');
//                         }
//                       });
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Documento porte obrigatório',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(width: 5,),
//                         SizedBox(
//                           width: 30,
//                           child: Icon(
//                             (saved.contains('dpo')) ? Icons.check_box : Icons.check_box_outline_blank,
//                             color: (saved.contains('dpo')) ? Colors.green : Colors.black,
//                             semanticLabel: (saved.contains('dpo')) ? 'Desmarcar' : 'Marcar',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40,)
//           ],
//         ),
//       ),
//     );
//   }
// }