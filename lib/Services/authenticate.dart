import 'package:cloud_firestore/cloud_firestore.dart';

setusers(String name, String email, String massage) async {
  final users = await FirebaseFirestore.instance.collection('users').add({
    'name': name,
    'age': email,
    'massage': massage,
  });
  return users;
}
