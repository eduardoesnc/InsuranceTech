import 'package:flutter/material.dart';
import 'package:insurancetech/components/drawer.dart';
import 'package:insurancetech/models/database.model.dart';
import '../components/pageTitle.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:typed_data';
import 'dart:convert';

class DocumentosPage extends StatefulWidget {
  const DocumentosPage({Key? key}) : super(key: key);

  static const routeName = '/documentos';

  @override
  State<DocumentosPage> createState() => _DocumentosPageState();
}

class _DocumentosPageState extends State<DocumentosPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  File? file = File('');


  final user = FirebaseAuth.instance.currentUser;
  final _firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    getUser();
    // Firebase.initializeApp().whenComplete(() {
    //   setState(() {});
    // });
  }

  getUser() async {
    User? usuario = _firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        nome = usuario.displayName!;
        email = usuario.email!;
      });
    }
  }

  List<File> selectedFiles = [];

  Future<void> _uploadFile(File file, String tipo) async {
    // Cria uma referência ao arquivo no Firebase Storage
    Reference storageReference =
        storage.ref().child("uploads/${file.path.split('/').last}");
    // Upload do arquivo para o Firebase Storage
    UploadTask uploadTask = storageReference.putFile(file);
    await uploadTask.whenComplete(() => null);
    // Obtenção da URL de download do arquivo
    String downloadUrl = await storageReference.getDownloadURL();
    // Adiciona um novo documento com as informações do arquivo no Firestore
    try{
      if (tipo == 'CNH'){
        OurDatabase().updateUserCNHURL(downloadUrl);
      }
      if (tipo == 'CRLV'){
        OurDatabase().updateUserCRLVURL(downloadUrl);
      }
      if (tipo == 'CR'){
        OurDatabase().updateUserCRURL(downloadUrl);
      }
      if (tipo == 'BO'){
        OurDatabase().updateUserBOURL(downloadUrl);
      }
    } on FirebaseException catch (e){
      throw Exception('Erro no upload: ${e.code}');
    }
    // Atualiza a lista de arquivos carregados
    setState(() {
      selectedFiles.add(file);
    });

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Documento enviado com sucesso!'),
          backgroundColor: Colors.greenAccent,
        ),
    );

  }

  Future<void> _selectFileCNH() async {
    String tipo = 'CNH';
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      _uploadFile(file, tipo);
    }
  } 


  Future<void> _selectFileCRLV() async {
    String tipo = 'CRLV';
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      _uploadFile(file, tipo);
    }
  }

    Future<void> _selectFileCR() async {
    String tipo = 'CR';
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      _uploadFile(file, tipo);
    }
  }

    Future<void> _selectFileBO() async {
    String tipo = 'BO';
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      _uploadFile(file, tipo);
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
            child: ListView(children: <Widget>[

              const SizedBox(height: 50),

              const pageTitle(
                  texto: 'Documentos necessários para reivindicar o seguro'
              ),

              const SizedBox(height: 50),

              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('usuários').doc(email).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final documents = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'CNH',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                    const SizedBox(height: 15,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: ListTile(
                        dense: true,
                        leading: Icon(Icons.file_copy, color: documents['cnhURL'] != '' ? Colors.green : Colors.grey,),
                        title: Text(documents['cnhURL'] != '' ? 'CNH de $nome' : '',),
                        subtitle: Text(documents['cnhURL'] != '' ? 'Clique para baixar sua CNH' : 'Você ainda não adicionou este documento'),
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['cnhURL'] != ''){
                            await canLaunchUrl(documents['cnhURL'])
                                ? await launchUrl(documents['cnhURL'])
                                : throw 'Could not launch ${documents['cnhURL']}';
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: ListTile(
                         title: const Text(
                          'Adicionar novo documento de CNH',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                         ),
                         onTap: _selectFileCNH,
                      ),
                    ),
                    
                  ],
                  );
                },
              ),

              const SizedBox(height: 50),

              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('usuários').doc(email).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final documents = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'CRLV',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                    const SizedBox(height: 15,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: ListTile(
                        dense: true,
                        leading: Icon(Icons.file_copy, color: documents['crlvURL'] != '' ? Colors.green : Colors.grey,),
                        title: Text(documents['crlvURL'] != '' ? 'CRLV de $nome' : '',),
                        subtitle: Text(documents['crlvURL'] != '' ? 'Clique para baixar sua CRLV' : 'Você ainda não adicionou este documento'),
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['crlvURL'] != ''){
                            await canLaunchUrl(documents['crlvURL'])
                                ? await launchUrl(documents['crlvURL'])
                                : throw 'Could not launch ${documents['crlvURL']}';
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: ListTile(
                         title: const Text(
                          'Adicionar novo documento de CRLV',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                         ),
                         onTap: _selectFileCRLV,
                      ),
                    ),
                    
                  ],
                  );
                },
              ),

              const SizedBox(height: 50),

              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('usuários').doc(email).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final documents = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Comprovante de Residência',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                    const SizedBox(height: 15,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: ListTile(
                        dense: true,
                        leading: Icon(Icons.file_copy, color: documents['crURL'] != '' ? Colors.green : Colors.grey,),
                        title: Text(documents['crURL'] != '' ? 'Comprovante de Residência de $nome' : '',),
                        subtitle: Text(documents['crURL'] != '' ? 'Clique para baixar sua Comprovante de Residência' : 'Você ainda não adicionou este documento'),
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['crURL'] != ''){
                            await canLaunchUrl(documents['crURL'])
                                ? await launchUrl(documents['crURL'])
                                : throw 'Could not launch ${documents['crURL']}';
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: ListTile(
                         title: const Text(
                          'Adicionar novo documento de Comprovante de Residência',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                         ),
                         onTap: _selectFileCR,
                      ),
                    ),
                    
                  ],
                  );
                },
              ),

              const SizedBox(height: 50),

              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('usuários').doc(email).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final documents = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Boletim de Ocorrência',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                    const SizedBox(height: 15,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: ListTile(
                        dense: true,
                        leading: Icon(Icons.file_copy, color: documents['boURL'] != '' ? Colors.green : Colors.grey,),
                        title: Text(documents['boURL'] != '' ? 'Boletim de Ocorrência de $nome' : '',),
                        subtitle: Text(documents['boURL'] != '' ? 'Clique para baixar sua Comprovante de Residência' : 'Você ainda não adicionou este documento'),
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['boURL'] != ''){
                            await canLaunchUrl(documents['boURL'])
                                ? await launchUrl(documents['boURL'])
                                : throw 'Could not launch ${documents['boURL']}';
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: ListTile(
                         title: const Text(
                          'Adicionar novo documento de Boletim de Ocorrência',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                         ),
                         onTap: _selectFileBO,
                      ),
                    ),
                    
                  ],
                  );
                },
              ),

              const SizedBox(height: 40,),

            ])));
  }
}
