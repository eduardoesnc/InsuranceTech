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

  // Criar um selectFile para cada documento

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
            child: Column(children: <Widget>[

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
                      'CNH', // Alterar pro nome do documento
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
                        leading: const Icon(Icons.file_copy),
                        title: Text(documents['cnhURL'] != null ? 'CNH de $nome' : '',), // Alterar pro nome do documento
                        subtitle: Text(documents['cnhURL'] != null ? 'Clique para baixar sua CNH' : 'Você ainda não adicionou este documento'), // Alterar pro nome do documento
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['cnhURL'] != null){
                            await canLaunchUrl(documents['cnhURL']) // Alterar pro nome do documento
                                ? await launchUrl(documents['cnhURL']) // Alterar pro nome do documento
                                : throw 'Could not launch ${documents['cnhURL']}'; // Alterar pro nome do documento
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
                          'Adicionar novo documento de CNH', // Alterar pro nome do documento
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                         ),
                         onTap: _selectFileCNH, // Alterar pro nome do documento
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
                      'CRLV', // Alterar pro nome do documento
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
                        leading: const Icon(Icons.file_copy),
                        title: Text(documents[' crlvURL'] != null ? 'CRLV de $nome' : '',), // Alterar pro nome do documento
                        subtitle: Text(documents['crlvURL'] != null ? 'Clique para baixar sua CRLV' : 'Você ainda não adicionou este documento'), // Alterar pro nome do documento
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['crlvURL'] != null){
                            await canLaunchUrl(documents['crlvURL']) // Alterar pro nome do documento
                                ? await launchUrl(documents['crlvURL']) // Alterar pro nome do documento
                                : throw 'Could not launch ${documents['crlvURL']}'; // Alterar pro nome do documento
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
                          'Adicionar novo documento de CRLV', // Alterar pro nome do documento
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                         ),
                         onTap: _selectFileCRLV, // Alterar pro nome do documento
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
                      'Comprovante de Residência', // Alterar pro nome do documento
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
                        leading: const Icon(Icons.file_copy),
                        title: Text(documents[' crURL'] != null ? 'Comprovante de Residência de $nome' : '',), // Alterar pro nome do documento
                        subtitle: Text(documents['crURL'] != null ? 'Clique para baixar sua Comprovante de Residência' : 'Você ainda não adicionou este documento'), // Alterar pro nome do documento
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['crURL'] != null){
                            await canLaunchUrl(documents['crURL']) // Alterar pro nome do documento
                                ? await launchUrl(documents['crURL']) // Alterar pro nome do documento
                                : throw 'Could not launch ${documents['crURL']}'; // Alterar pro nome do documento
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
                          'Adicionar novo documento de Comprovante de Residência', // Alterar pro nome do documento
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                         ),
                         onTap: _selectFileCR, // Alterar pro nome do documento
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
                      'Boletim de Ocorrência', // Alterar pro nome do documento
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
                        leading: const Icon(Icons.file_copy),
                        title: Text(documents[' boURL'] != null ? 'Boletim de Ocorrência de $nome' : '',), // Alterar pro nome do documento
                        subtitle: Text(documents['boURL'] != null ? 'Clique para baixar sua Comprovante de Residência' : 'Você ainda não adicionou este documento'), // Alterar pro nome do documento
                        onTap: () async {
                          // Abre a URL de download do arquivo no navegador
                          if(documents['boURL'] != null){
                            await canLaunchUrl(documents['boURL']) // Alterar pro nome do documento
                                ? await launchUrl(documents['boURL']) // Alterar pro nome do documento
                                : throw 'Could not launch ${documents['boURL']}'; // Alterar pro nome do documento
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
                          'Adicionar novo documento de Boletim de Ocorrência', // Alterar pro nome do documento
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                         ),
                         onTap: _selectFileBO, // Alterar pro nome do documento
                      ),
                    ),
                    
                  ],
                  );
                },
              ),

            ])));
  }
}
