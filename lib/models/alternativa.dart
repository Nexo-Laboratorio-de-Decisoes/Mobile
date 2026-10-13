class Alternativa {
  const Alternativa({
    required this.id,
    required this.cenarioId,
    required this.rotulo,
    required this.descricao,
    required this.consequencia,
    required this.beneficio,
    required this.limitacao,
  });

  final int id;
  final int cenarioId;
  final String rotulo;
  final String descricao;
  final String consequencia;
  final String beneficio;
  final String limitacao;
}
