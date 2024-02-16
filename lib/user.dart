import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String photoUrl;
  final String email;
  final String phoneNumber;
  final String address;
  final String birthDate;

  const User({
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "photoUrl": photoUrl,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "birthDate": birthDate,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot["uid"],
      username: snapshot["username"],
      photoUrl: snapshot["photoUrl"],
      email: snapshot["email"],
      phoneNumber: snapshot["phoneNumber"],
      address: snapshot["address"],
      birthDate: snapshot["birthDate"],
    );
  }
}
