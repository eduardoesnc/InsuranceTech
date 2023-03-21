import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insurancetech/models/user.model.dart';

class OurDatabase{
  final FirebaseFirestore docUser =  FirebaseFirestore.instance;

  Future createUser({required String nome, required String email,}) async {
    final docUser =  FirebaseFirestore.instance.collection('usuários').doc(email);

    final user = OurUser(
      id: docUser.id,
      nome: nome,
      email: email,
      imageURL: '',
    );

    final json = user.toJson();
    await docUser.set(json);

  }

  updateUserImageURL(imageUrl) async {
    final _user= FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection('usuários')
        .doc(_user?.email);
    docUser.update({
      'imageURL':imageUrl,
    });
  }

  updateUserName(nome) async {
    final _user= FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection('usuários')
        .doc(_user?.email);
    docUser.update({
      'nome':nome,
    });
  }


}