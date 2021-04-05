class User {
  int id;
  String email;
  String password;
  String nickName;

  User({this.email, this.nickName, this.id, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'password': this.password,
      'nickName': this.nickName
    };
  }
}
