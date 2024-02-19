import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String photoUrl;
  final String email;
  final String phoneNumber;
  final String address;
  final String birthDate;
  final bool isConsultant;

  const User({
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.isConsultant,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "photoUrl": photoUrl,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "birthDate": birthDate,
        "isConsultant": isConsultant,
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
      isConsultant: snapshot["isConsultant"],
    );
  }
}
