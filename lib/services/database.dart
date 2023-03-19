import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insurancetech/models/user.dart';

class OurDatabase{
  final FirebaseFirestore docUser =  FirebaseFirestore.instance;

  Future createUser({required String nome, required String email, imageURL}) async {
    final docUser =  FirebaseFirestore.instance.collection('usuários').doc(email);

    final user = OurUser(
      id: docUser.id,
      nome: nome,
      email: email,
      imageURL: imageURL,
    );

    final json = user.toJson();
    await docUser.set(json);

  }

  Future<OurUser?> readUser(email) async {
    final docUser = FirebaseFirestore.instance.collection('usuários').doc(email);
    final snapshot = await docUser.get();

    if (snapshot.exists){
      return OurUser.fromJson(snapshot.data()!);
    }
  }

  updateUserImageURL(email, novoValor) async {
    final docUser = await FirebaseFirestore.instance
        .collection('usuários')
        .doc(email);
    docUser.update({
      'imageURL':novoValor,
    });
  }

}