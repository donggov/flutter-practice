import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/utilities/constants.dart';

class DatabaseService {

  static updateUser(User user) {
    userRef.document(user.id).updateData({
      'name': user.name,
      'profileImageUrl': user.profileImageUrl,
      'bio': user.bio,
    });
  }

  static Future<QuerySnapshot> findAllUsersByName(String name) {
    // todo : like 검색 어떻게 하지???
    Future<QuerySnapshot> users = userRef.where('name', isGreaterThanOrEqualTo: name).getDocuments();
    return users;
  }

}