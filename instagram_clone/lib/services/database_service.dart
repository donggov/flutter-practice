import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/utilities/constants.dart';

class DatabaseService {

  static updateUser(User user) {
    userRef.document(user.id).updateData({
      'name': user.name,
      'pofileImageUrl': user.profileImageUrl,
      'bio': user.bio,
    });
  }

}