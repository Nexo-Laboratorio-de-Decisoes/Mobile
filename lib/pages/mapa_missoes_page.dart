import 'package:flutter/material.dart';
import 'package:nexo/data/cenarios_mock.dart';
import 'package:nexo/models/cenario.dart';
import 'package:nexo/models/decisao.dart';
import 'package:nexo/pages/cenario_page.dart';
import 'package:nexo/pages/progresso_page.dart';
import 'package:nexo/tema.dart';
import 'package:nexo/widgets/missao_card.dart';
import 'package:nexo/widgets/resumo_progresso.dart';

class MapaMissoesPage extends StatefulWidget {
  const MapaMissoesPage({super.key, required this.apelido});

  final String apelido;

  @override
  State<MapaMissoesPage> createState() => _MapaMissoesPageState();
}

class _MapaMissoesPageState extends State<MapaMissoesPage> {
  // A sessão pertence a esta tela. Não há banco nem estado global.
  final List<Decisao> _decisoes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Boas-vindas ao NEXO, ${widget.apelido}!')),
      );
    });
  }

  Future<void> abrirMissao(Cenario cenario) async {
    final decisao = await Navigator.of(context).push<Decisao>(
      MaterialPageRoute(
        builder: (context) =>
            CenarioPage(cenario: cenario, apelido: widget.apelido),
      ),
    );
    if (!mounted || decisao == null) return;

    // Uma única decisão por cenário: refazer troca a escolha, não soma pontos.
    setState(() {
      final indice = _decisoes.indexWhere(
        (item) => item.cenarioId == decisao.cenarioId,
      );
      if (indice == -1) {
        _decisoes.add(decisao);
      } else {
        _decisoes[indice] = decisao;
      }
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Descoberta registrada na sua jornada!')),
    );
  }

  void abrirProgresso() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProgressoPage(
          apelido: widget.apelido,
          decisoes: List.of(_decisoes),
          cenarios: cenariosMock,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NEXO',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 3),
        ),
        actions: [
          IconButton(
            key: const Key('abrir_progresso'),
            onPressed: abrirProgresso,
            tooltip: 'Meu progresso',
            icon: const Icon(Icons.person_outline_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              key: const Key('lista_missoes'),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Text('Olá, ${widget.apelido}!', style: textos.bodyLarge),
                const SizedBox(height: 8),
                Text(
                  'Qual será sua\npróxima descoberta?',
                  style: textos.headlineLarge,
                ),
                const SizedBox(height: 24),
                ResumoProgresso(
                  concluidas: _decisoes.length,
                  total: cenariosMock.length,
                ),
                const SizedBox(height: 24),
                Text('Mapa de missões', style: textos.titleLarge),
                const SizedBox(height: 8),
                const Text(
                  'Cinco áreas. Novas formas de olhar para a ciência.',
                ),
                const SizedBox(height: 16),
                for (final cenario in cenariosMock)
                  MissaoCard(
                    cenario: cenario,
                    concluida: _decisoes.any(
                      (item) => item.cenarioId == cenario.id,
                    ),
                    onTap: () => abrirMissao(cenario),
                  ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: abrirProgresso,
                  icon: const Icon(Icons.insights_outlined),
                  label: const Text('Ver meu progresso'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Cenários fictícios para aprender com escolhas.\nNão existe uma solução melhor para todo contexto.',
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
