class User {
  late int id;
  late String email;
  late String password;
  late String Name;
  late String surName;
  late int state;
  late int rol;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.Name,
      required this.surName,
      required this.state,
      required this.rol});

  factory User.desdeJson(Map<String, dynamic> jsonMap) {
    return User(
        id: int.parse(jsonMap['id']),
        Name: jsonMap['name'],
        surName: jsonMap['surname'],
        email: jsonMap['email'],
        password: jsonMap['password'],
        state: int.parse(jsonMap['state']),
        rol: int.parse(jsonMap['role']));
  }
}
