class Grupo {
  final int id;
  final String nome;

  Grupo({
    required this.id,
    required this.nome,
  });

  factory Grupo.fromJson(Map<String, dynamic> json) {
    return Grupo(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
