import 'package:flutter/material.dart';
import 'package:nexo/models/cenario.dart';
import 'package:nexo/tema.dart';

IconData iconeCategoria(String categoria) {
  switch (categoria) {
    case 'Saúde':
      return Icons.health_and_safety_outlined;
    case 'Agricultura':
      return Icons.eco_outlined;
    case 'Indústria':
      return Icons.precision_manufacturing_outlined;
    case 'Pesquisa':
      return Icons.science_outlined;
    default:
      return Icons.bolt_outlined;
  }
}

class MissaoCard extends StatelessWidget {
  const MissaoCard({
    super.key,
    required this.cenario,
    required this.concluida,
    required this.onTap,
  });

  final Cenario cenario;
  final bool concluida;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: InkWell(
          key: Key('missao_${cenario.id}'),
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF7FB),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(iconeCategoria(cenario.categoria), color: azulNexo),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cenario.categoria.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1.3, color: Color(0xFF007A96))),
                      const SizedBox(height: 6),
                      Text(cenario.titulo, style: textos.titleMedium),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(concluida ? Icons.check_circle_outline : Icons.explore_outlined, size: 16, color: concluida ? const Color(0xFF176A50) : textoSecundario),
                          const SizedBox(width: 6),
                          Expanded(child: Text(concluida ? 'Concluída • explorar de novo' : 'Pronta para explorar', style: const TextStyle(fontSize: 12))),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, size: 20, color: azulNexo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
