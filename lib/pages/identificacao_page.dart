import 'package:flutter/material.dart';
import 'package:nexo/pages/mapa_missoes_page.dart';
import 'package:nexo/tema.dart';

class IdentificacaoPage extends StatefulWidget {
  const IdentificacaoPage({super.key});

  @override
  State<IdentificacaoPage> createState() => _IdentificacaoPageState();
}

class _IdentificacaoPageState extends State<IdentificacaoPage> {
  final _formKey = GlobalKey<FormState>();
  final _apelidoController = TextEditingController();
  bool _iniciando = false;

  String? validarApelido(String? valor) {
    final apelido = (valor ?? '').trim();
    if (apelido.isEmpty) return 'Digite seu apelido para começar.';
    if (apelido.characters.length < 3) return 'Use pelo menos 3 caracteres.';
    if (apelido.characters.length > 20) return 'Use no máximo 20 caracteres.';
    return null;
  }

  void comecarJornada() {
    if (_iniciando || !_formKey.currentState!.validate()) return;
    setState(() => _iniciando = true);
    FocusScope.of(context).unfocus();
    final apelido = _apelidoController.text.trim();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MapaMissoesPage(apelido: apelido),
      ),
    );
  }

  @override
  void dispose() {
    _apelidoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Image.asset(
                      'assets/images/nexo_logo.png',
                      fit: BoxFit.contain,
                      semanticLabel: 'NEXO — Laboratório de Decisões',
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'EXPLORE. DECIDA. DESCUBRA.',
                      style: TextStyle(
                        color: Color(0xFF007A96),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'A ciência faz parte\ndas suas escolhas.',
                      style: textos.headlineLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Investigue situações do cotidiano e descubra onde a tecnologia nuclear pode contribuir.',
                      style: textos.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    const Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(
                          avatar: Icon(Icons.explore_outlined, size: 18),
                          label: Text('5 missões'),
                        ),
                        Chip(
                          avatar: Icon(Icons.wifi_off_rounded, size: 18),
                          label: Text('Explore offline'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Como podemos chamar você?',
                      style: textos.titleMedium,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const Key('campo_apelido'),
                      controller: _apelidoController,
                      validator: validarApelido,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => comecarJornada(),
                      decoration: const InputDecoration(
                        labelText: 'Seu apelido',
                        hintText: 'Ex.: Biels',
                        helperText: 'De 3 a 20 caracteres',
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      key: const Key('comecar_jornada'),
                      onPressed: _iniciando ? null : comecarJornada,
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text('Começar jornada'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Seu apelido e progresso ficam apenas nesta sessão. Ao reiniciar o aplicativo, você começa uma nova jornada.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: textoSecundario,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'FIAP  •  CHALLENGE 2026',
                        style: TextStyle(fontSize: 11, letterSpacing: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
