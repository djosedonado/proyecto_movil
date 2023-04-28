class Messge {
  late String messge;
  Messge({required this.messge});

  factory Messge.desdeJson(Map<String,dynamic> jsonMap){
    return Messge(messge: jsonMap['messge']);
  }
}