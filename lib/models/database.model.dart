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
      cnhURL: '',
      crlvURL: '',
      crURL: '',
      boURL: '',

    );

    final json = user.toJson();
    await docUser.set(json);

  }

  updateUserCNHURL(cnhURL) async{
    final _user= FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection('usuários')
        .doc(_user?.email);
    docUser.update({
      'cnhURL': cnhURL,
    });
  }

    updateUsercrlvURL(crlvURL) async{
    final _user= FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection('usuários')
        .doc(_user?.email);
    docUser.update({
      'crlvURL': crlvURL,
    });
  }
  
    updateUsercrURL(crURL) async{
    final _user= FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection('usuários')
        .doc(_user?.email);
    docUser.update({
      'crURL': crURL,
    });
  }

    updateUserboURL(boURL) async{
    final _user= FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance
        .collection('usuários')
        .doc(_user?.email);
    docUser.update({
      'boURL': boURL,
    });
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