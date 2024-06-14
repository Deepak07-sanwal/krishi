class UserDetailsModel {
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? avatarUrl;
  UserDetailsModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.avatarUrl,
  });

  toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl,
    };
  }
}