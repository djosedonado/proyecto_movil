class Article {
  late int id;
  late String name;
  late String codigo;
  late double valor;
  late int unidad;
  late String img;
  late int idUser;

  Article(
      {required this.id,
      required this.idUser,
      required this.codigo,
      required this.unidad,
      required this.img,
      required this.name,
      required this.valor});
  factory Article.desdeJson(Map<String, dynamic> jsonMap) {
    return Article(
        id: int.parse(jsonMap['id']),
        idUser: int.parse(jsonMap['idUser']),
        codigo: jsonMap['codigo'],
        unidad: int.parse(jsonMap['unidad']),
        img: jsonMap['image'],
        name: jsonMap['name'],
        valor: double.parse(jsonMap['valor']));
  }
}



