import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/alterarNomeUsuario.dart';


class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({Key? key}) : super(key: key);

  static const routeName = '/editarPerfil';

  getFotoPerfil(){
    XFile foto = _EditarPerfilPageState()._imageFile;
    return  foto.path;
  }

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  @override
  initState() {
    super.initState();
    getUser();
  }

  XFile _imageFile = XFile('');
  final ImagePicker _picker = ImagePicker();

  final _emailController = TextEditingController();
  final _emailUserController = TextEditingController();
  final _nomeUserController = TextEditingController();
  bool isObscurePassword = true;
  final _firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email = '';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a5298),
        title: const Text('Editar perfil'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: () {
              if(_nomeUserController.text != '') {
                updateUserName(_nomeUserController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Nome de usuário alterado com sucesso'),
                    backgroundColor: Colors.greenAccent,
                  ),
                );
              }
              Navigator.of(context).popAndPushNamed('/home');
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Center(
              child: Stack(
                children: [
                  imageProfile(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildTextField('Nome', nome, false),
            //buildTextField2('Email', email, false),
            //buildTextField('Senha', '*********', true),
            const SizedBox(height: 30),
            TextButton(
              child: const Text(
                "Alterar senha ",
                style: TextStyle(
                  color: Color(0xFF2a5298),
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                resetPassword();
              },
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildTextField(
      String? labelText, String? placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: _nomeUserController,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye, color: Colors.blue),
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    })
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget buildTextField2(
      String? labelText, String? placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: _emailUserController,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    })
                : null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
  }



   Widget imageProfile() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: (_imageFile.path.isEmpty)
              ?const AssetImage('assets/profile.jpeg')
              :FileImage(File(_imageFile.path)) as ImageProvider,
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context,
                    builder: ((builder) => bottomSheet()),
                );
              },
              child: const Icon(
                Icons.edit,
                color: Color(0xFF2a5298),
                size: 28,
              ),
            ))
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            const Text(
              "Escolha sua foto de perfil",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  icon:const Icon(Icons.camera_alt_outlined),
                  onPressed: (){
                    takeImage(ImageSource.camera);
                  },
                  label: const Text('Camera'),
                ),
                TextButton.icon(
                  icon:const Icon(Icons.image_outlined),
                  onPressed: (){
                      takeImage(ImageSource.gallery);
                  },
                  label: const Text('Galeria'),
                ),
              ],
            )
          ],
        ));
  }

  void takeImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      if (pickedFile != null) {
        _imageFile = pickedFile;
      } else {
        _imageFile = XFile('');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Nenhum arquivo carregado'),
              content: const Text('Por favor, selecione um arquivo para continuar.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
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

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Email de  alteração de senha enviado. Verifique sua caixa de entrada e spam'),
          backgroundColor: Colors.blueAccent,
        ),
      );
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email não cadastrado'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
