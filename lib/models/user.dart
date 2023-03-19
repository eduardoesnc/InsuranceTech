class OurUser{
  String? id;
  String? email;
  String? nome;
  late String? imageURL;

  OurUser({
    this.id,
    required this.email,
    required this.nome,
    this.imageURL,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'email':email,
    'imageURL': imageURL,
  };

  static OurUser fromJson(Map<String, dynamic>json) => OurUser(
    id: json['id'],
    nome: json['nome'],
    email: json['email'],
    imageURL: json['imageURL'],
  );


}
