import 'package:flutter/material.dart';
import 'package:nexo/models/alternativa.dart';
import 'package:nexo/models/cenario.dart';
import 'package:nexo/tema.dart';

class ConsequenciaPage extends StatelessWidget {
  const ConsequenciaPage({
    super.key,
    required this.cenario,
    required this.alternativa,
  });

  final Cenario cenario;
  final Alternativa alternativa;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Sua descoberta')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              key: const Key('conteudo_consequencia'),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Text(
                  'Uma escolha.\nNovas perspectivas.',
                  style: textos.headlineLarge,
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: azulNexo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VOCÊ ESCOLHEU A ALTERNATIVA ${alternativa.rotulo}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF93E7FA),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        alternativa.descricao,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text('O que essa decisão significa', style: textos.titleLarge),
                const SizedBox(height: 12),
                Text(
                  alternativa.consequencia,
                  key: const Key('texto_consequencia'),
                  style: textos.bodyLarge,
                ),
                const SizedBox(height: 24),
                _ExplicacaoCard(
                  titulo: 'Possibilidade',
                  texto: alternativa.beneficio,
                  icone: Icons.add_circle_outline,
                  cor: const Color(0xFF176A50),
                ),
                const SizedBox(height: 12),
                _ExplicacaoCard(
                  titulo: 'Ponto de atenção',
                  texto: alternativa.limitacao,
                  icone: Icons.info_outline,
                  cor: const Color(0xFF936000),
                ),
                const SizedBox(height: 24),
                Card(
                  color: const Color(0xFFE7F4FA),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.lightbulb_outline,
                              color: azulNexo,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Mito ou fato?',
                                style: textos.titleLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text('“${cenario.afirmacao}”', style: textos.bodyLarge),
                        const SizedBox(height: 12),
                        Text(
                          cenario.ehMito ? 'MITO' : 'FATO',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                            color: azulNexo,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(cenario.explicacao),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'De onde vem esse conhecimento',
                  style: textos.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(cenario.fonteTitulo),
                const SizedBox(height: 8),
                SelectableText(
                  cenario.fonteUrl,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: Color(0xFF007A96),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  key: const Key('concluir_missao'),
                  onPressed: () {
                    // Evita dois retornos se houver toques rápidos na conclusão.
                    if (ModalRoute.of(context)?.isCurrent == true) {
                      Navigator.of(context).pop(true);
                    }
                  },
                  icon: const Icon(Icons.check_rounded),
                  label: const Text('Concluir missão'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Reconsiderar minha escolha'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExplicacaoCard extends StatelessWidget {
  const _ExplicacaoCard({
    required this.titulo,
    required this.texto,
    required this.icone,
    required this.cor,
  });

  final String titulo;
  final String texto;
  final IconData icone;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icone, color: cor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: cor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(texto),
          ],
        ),
      ),
    );
  }
}
