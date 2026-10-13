class Decisao {
  const Decisao({
    required this.cenarioId,
    required this.alternativaId,
    required this.apelido,
    required this.dataEscolha,
  });

  final int cenarioId;
  final int alternativaId;
  final String apelido;
  final DateTime dataEscolha;
}
