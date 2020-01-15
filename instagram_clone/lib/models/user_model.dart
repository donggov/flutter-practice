import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  final String id;
  final String name;
  final String profileImageUrl;
  final String email;
  final String bio;

  const User({this.id, this.name, this.profileImageUrl, this.email, this.bio});

  @override
  String toString() {
    return 'User{id: $id, name: $name, profileImageUrl: $profileImageUrl, email: $email, bio: $bio}';
  }

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      email: doc['email'],
      profileImageUrl: doc['profileImageUrl'] ?? '',
      bio: doc['bio'] ?? '',
    );
  }

}