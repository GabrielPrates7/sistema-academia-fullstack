class Exercicio {
  final int id;
  final String nome;

  Exercicio({
    required this.id,
    required this.nome,
  });

  factory Exercicio.fromJson(Map<String, dynamic> json) {
    return Exercicio(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
