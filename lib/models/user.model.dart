class OurUser{
  String? id;
  String? email;
  String? nome;
  late String? imageURL;
  late String? cnhURL;
  late String? crlvURL;
  late String? crURL;
  late String? boURL;

  OurUser({
    this.id,
    required this.email,
    required this.nome,
    this.imageURL,
    this.cnhURL,
    this.crlvURL,
    this.boURL,
    this.crURL,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'email':email,
    'imageURL': imageURL,
    'cnhURL': cnhURL,
    'crlvURL': crlvURL,
    'boURL': boURL,
    'crURL': crURL,
  };

  static OurUser fromJson(Map<String, dynamic>json) => OurUser(
    id: json['id'],
    nome: json['nome'],
    email: json['email'],
    imageURL: json['imageURL'],
    cnhURL: json['cnhURL'],
    crlvURL: json['crlvURL'],
    boURL: json['boURL'],
    crURL: json['crURL'],
  );


}
