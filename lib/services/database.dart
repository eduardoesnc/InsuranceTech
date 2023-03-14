import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insurancetech/models/user.dart';

class OurDatabase{
  final FirebaseFirestore _firestore =  FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";
    try{
      await _firestore.collection('usuários').doc(user.uid).set({
        'nome' : user.nome,
        'email': user.email,
        'imageUrl' : user.imageURL,
      });
      retVal = "sucess";
    }catch(e) {
      print(e);
    }
    return retVal;
  }
}