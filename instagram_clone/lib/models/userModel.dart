class User {

  final String id;
  final String name;
  final String profileImageUrl;
  final String email;
  final String bio;

  User({this.id, this.name, this.profileImageUrl, this.email, this.bio});

  @override
  String toString() {
    return 'User{id: $id, name: $name, profileImageUrl: $profileImageUrl, email: $email, bio: $bio}';
  }

}