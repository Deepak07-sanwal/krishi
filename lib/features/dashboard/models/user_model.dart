import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? avatarUrl;
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.avatarUrl,
  });

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserModel(
      uid: snapshot.data()!['uid'],
      name: snapshot.data()!['name'],
      email: snapshot.data()!['email'],
      phoneNumber: snapshot.data()!['phoneNumber'],
      avatarUrl: snapshot.data()!['avatarUrl'],
    );
  }
}
