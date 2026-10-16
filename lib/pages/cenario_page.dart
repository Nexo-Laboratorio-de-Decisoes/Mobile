import 'package:flutter/material.dart';
import 'package:nexo/models/alternativa.dart';
import 'package:nexo/models/cenario.dart';
import 'package:nexo/models/decisao.dart';
import 'package:nexo/pages/consequencia_page.dart';
import 'package:nexo/tema.dart';
import 'package:nexo/widgets/missao_card.dart';

class CenarioPage extends StatefulWidget {
  const CenarioPage({super.key, required this.cenario, required this.apelido});

  final Cenario cenario;
  final String apelido;

  @override
  State<CenarioPage> createState() => _CenarioPageState();
}

class _CenarioPageState extends State<CenarioPage> {
  Alternativa? _selecionada;
  bool _abrindoConsequencia = false;

  Future<void> verConsequencia() async {
    final alternativa = _selecionada;
    if (alternativa == null || _abrindoConsequencia) return;
    setState(() => _abrindoConsequencia = true);

    final concluiu = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (context) => ConsequenciaPage(cenario: widget.cenario, alternativa: alternativa)),
    );
    if (!mounted) return;
    if (concluiu == true) {
      // Retorna ao mapa com dados somente depois da confirmação no feedback.
      Navigator.of(context).pop(Decisao(
        cenarioId: widget.cenario.id,
        alternativaId: alternativa.id,
        apelido: widget.apelido,
        dataEscolha: DateTime.now(),
      ));
    } else {
      setState(() => _abrindoConsequencia = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cenario = widget.cenario;
    final textos = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(cenario.categoria)),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              key: const Key('conteudo_cenario'),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Row(children: [
                  Icon(iconeCategoria(cenario.categoria), color: const Color(0xFF007A96)),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('INVESTIGUE O CENÁRIO', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.2, color: Color(0xFF007A96)))),
                ]),
                const SizedBox(height: 16),
                Text(cenario.titulo, style: textos.headlineLarge),
                const SizedBox(height: 16),
                Text(cenario.situacao, style: textos.bodyLarge),
                const SizedBox(height: 16),
                const Text('Situação fictícia • experiência educativa', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: const Color(0xFFE7F4FA), borderRadius: BorderRadius.circular(16)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('O que você vai descobrir', style: textos.titleMedium),
                    const SizedBox(height: 8),
                    Text(cenario.objetivoEducacional),
                  ]),
                ),
                const SizedBox(height: 24),
                Text('Qual caminho você investigaria?', style: textos.titleLarge),
                const SizedBox(height: 8),
                const Text('Escolha uma alternativa para descobrir suas possibilidades e limitações.'),
                const SizedBox(height: 16),
                for (final alternativa in cenario.alternativas)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Semantics(
                      selected: _selecionada == alternativa,
                      button: true,
                      child: Card(
                        color: _selecionada == alternativa ? const Color(0xFFE2F6FC) : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: _selecionada == alternativa ? const Color(0xFF007A96) : const Color(0xFFE0E7F0), width: _selecionada == alternativa ? 2 : 1),
                        ),
                        child: InkWell(
                          key: Key('alternativa_${alternativa.rotulo}'),
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => setState(() => _selecionada = alternativa),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              CircleAvatar(radius: 18, backgroundColor: azulNexo, foregroundColor: Colors.white, child: Text(alternativa.rotulo)),
                              const SizedBox(width: 12),
                              Expanded(child: Text(alternativa.descricao, style: textos.bodyLarge)),
                              const SizedBox(width: 8),
                              Icon(_selecionada == alternativa ? Icons.check_circle : Icons.radio_button_unchecked, color: _selecionada == alternativa ? azulNexo : textoSecundario),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  key: const Key('ver_consequencia'),
                  onPressed: _selecionada == null || _abrindoConsequencia ? null : verConsequencia,
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Ver consequência'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
