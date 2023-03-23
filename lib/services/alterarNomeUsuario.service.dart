import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> updateUserName(String userName) async {

  final User? user = auth.currentUser;
  await user?.updateDisplayName(userName);


}

//updateUserName('Novo nome de usuário');