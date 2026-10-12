import 'package:flutter/material.dart';
import 'package:nexo/pages/identificacao_page.dart';
import 'package:nexo/tema.dart';

void main() {
  runApp(const NexoApp());
}

class NexoApp extends StatelessWidget {
  const NexoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEXO — Laboratório de Decisões',
      debugShowCheckedModeBanner: false,
      theme: criarTema(),
      home: const IdentificacaoPage(),
    );
  }
}
