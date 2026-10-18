import 'package:flutter/material.dart';
import 'package:nexo/models/cenario.dart';
import 'package:nexo/models/decisao.dart';
import 'package:nexo/tema.dart';
import 'package:nexo/widgets/missao_card.dart';
import 'package:nexo/widgets/resumo_progresso.dart';

class ProgressoPage extends StatelessWidget {
  const ProgressoPage({
    super.key,
    required this.apelido,
    required this.decisoes,
    required this.cenarios,
  });

  final String apelido;
  final List<Decisao> decisoes;
  final List<Cenario> cenarios;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Meu progresso')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              key: const Key('conteudo_progresso'),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xFFE1F3FA),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 32,
                        color: azulNexo,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(apelido, style: textos.headlineSmall),
                          const Text('Uma jornada de descobertas'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ResumoProgresso(
                  concluidas: decisoes.length,
                  total: cenarios.length,
                ),
                const SizedBox(height: 24),
                Text('O que você já explorou', style: textos.titleLarge),
                const SizedBox(height: 16),
                if (decisoes.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.travel_explore_rounded,
                            size: 48,
                            color: Color(0xFF007A96),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Sua primeira descoberta espera por você.',
                            textAlign: TextAlign.center,
                            style: textos.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Escolha uma missão no mapa e conclua a leitura da consequência para registrar seu progresso.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  for (final decisao in decisoes)
                    _DecisaoCard(
                      decisao: decisao,
                      cenario: cenarios.firstWhere(
                        (item) => item.id == decisao.cenarioId,
                      ),
                    ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.explore_outlined),
                  label: const Text('Voltar às missões'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'O progresso fica apenas nesta sessão. Ao reiniciar o aplicativo, sua jornada começa do zero.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: textoSecundario,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DecisaoCard extends StatelessWidget {
  const _DecisaoCard({required this.decisao, required this.cenario});

  final Decisao decisao;
  final Cenario cenario;

  @override
  Widget build(BuildContext context) {
    final alternativa = cenario.alternativas.firstWhere(
      (item) => item.id == decisao.alternativaId,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(iconeCategoria(cenario.categoria), color: azulNexo),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      cenario.categoria,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF176A50),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                cenario.titulo,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Última escolha: alternativa ${alternativa.rotulo}',
                key: Key('ultima_escolha_${cenario.id}'),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF007A96),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(alternativa.descricao),
            ],
          ),
        ),
      ),
    );
  }
}
