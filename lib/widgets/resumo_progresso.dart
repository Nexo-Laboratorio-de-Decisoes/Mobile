import 'package:flutter/material.dart';
import 'package:nexo/tema.dart';

class ResumoProgresso extends StatelessWidget {
  const ResumoProgresso({super.key, required this.concluidas, required this.total});

  final int concluidas;
  final int total;

  @override
  Widget build(BuildContext context) {
    final progresso = total == 0 ? 0.0 : concluidas / total;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: azulNexo, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.route_outlined, color: cianoNexo, size: 20),
              const SizedBox(width: 8),
              const Expanded(child: Text('SUA JORNADA', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.4))),
              Text('${(progresso * 100).round()}%', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 16),
          Text('$concluidas de $total missões concluídas', key: const Key('contador_missoes'), style: const TextStyle(color: Colors.white, fontSize: 22, height: 1.3, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: progresso,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
            color: cianoNexo,
            backgroundColor: const Color(0xFF355071),
            semanticsLabel: 'Progresso das missões',
            semanticsValue: '${(progresso * 100).round()} por cento',
          ),
          const SizedBox(height: 16),
          Text(
            concluidas == total ? 'Jornada concluída! Você pode revisitar as missões e experimentar outras escolhas.' : 'Cada escolha abre uma nova descoberta.',
            style: const TextStyle(color: Color(0xFFDFEAF7), height: 1.5, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
