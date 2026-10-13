import 'package:nexo/models/alternativa.dart';

class Cenario {
  const Cenario({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.situacao,
    required this.objetivoEducacional,
    required this.alternativas,
    required this.afirmacao,
    required this.ehMito,
    required this.explicacao,
    required this.fonteTitulo,
    required this.fonteUrl,
  });

  final int id;
  final String titulo;
  final String categoria;
  final String situacao;
  final String objetivoEducacional;
  final List<Alternativa> alternativas;
  final String afirmacao;
  final bool ehMito;
  final String explicacao;
  final String fonteTitulo;
  final String fonteUrl;
}
