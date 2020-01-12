import 'userModel.dart';

class UserRepository {

  static const _allUsers = <User>[
    User(
      id: "a",
      name: "PANSUK",
      email: "donggov@gmail.com",
      bio: "Traveler"
    ),
    User(
      id: "b",
      name: "Eddie",
      email: "eddie@gmail.com",
      bio: "",
    ),
    User(
      id: "c",
      name: "Donggo",
      email: "donggo@gmail.com",
      bio: "",
    ),
  ];

  static User findById(String id) {
    return _allUsers.where((user) => user.id == id).toList().first;
  }

  static List<User> findAllByName(String name) {
    name = name.trim();
    if (name.isEmpty) {
      return null;

    } else {
      return _allUsers
          .where((user) => user.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }
  }

}