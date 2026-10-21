# NEXO — Laboratório de Decisões

O NEXO é um aplicativo educativo para explorar aplicações civis da tecnologia nuclear. Em cinco missões, o usuário analisa situações do cotidiano, escolhe uma alternativa e descobre seus benefícios e limitações.

Projeto desenvolvido em Flutter para o Challenge FIAP 2026 — Sprint 1 de Mobile Application Development, em parceria com a Marinha do Brasil / CTMSP.

## Equipe

| RM | E-mail |
| --- | --- |
| 566682 | bielstuani@gmail.com |
| 568227 | guialberti2005@gmail.com |
| 567726 | luizkichimoto@gmail.com |
| 567918 | lseripieri4@gmail.com |
| | grochasouzadev@gmail.com |

## Como funciona

1. **Identificação:** escolha um apelido de 3 a 20 caracteres.
2. **Mapa de Missões:** explore Saúde, Agricultura, Indústria, Pesquisa e Energia.
3. **Cenário:** leia a situação e selecione uma das duas alternativas.
4. **Consequência:** veja a explicação da escolha, um mito ou fato e a fonte consultada. Toque em **Concluir missão** para registrar a decisão.
5. **Meu progresso:** acompanhe as missões concluídas e a última escolha de cada uma.

Todas as missões ficam disponíveis desde o início. Refazer uma missão atualiza a escolha sem aumentar a contagem; voltar antes de concluir não registra a decisão.

O aplicativo funciona offline, com cenários fictícios e dados mockados. O apelido e o progresso ficam em memória e são reiniciados ao encerrar o aplicativo.

Veja as [telas do aplicativo](docs/telas.md).

## Tecnologias

- Flutter 3.47.2 e Dart 3.13.2.
- Widgets Material, navegação com `Navigator` e estado com `setState`.
- Android SDK 36; Android mínimo 7.0 (API 24).
- OpenJDK 25 no ambiente de desenvolvimento, com compilação Android para Java 17.

## Executar

Com Flutter, Android SDK e um emulador ou aparelho Android configurados:

```bash
flutter pub get
flutter devices
flutter run -d ID_DO_DISPOSITIVO
```

Substitua `ID_DO_DISPOSITIVO` pelo identificador listado em `flutter devices`. Use `flutter doctor -v` para verificar o ambiente.

## Gerar APK

```bash
flutter build apk --release
```

O APK é gerado em `build/app/outputs/flutter-apk/app-release.apk`, com assinatura de desenvolvimento para demonstração.

## Estrutura

```text
lib/
  main.dart       # Entrada do aplicativo
  tema.dart       # Cores e estilos
  models/         # Cenário, alternativa e decisão
  data/           # Missões e referências
  pages/          # Cinco telas
  widgets/        # Componentes compartilhados
```

As telas recebem dados pelo construtor. O mapa mantém as decisões da sessão e atualiza o progresso quando uma missão é concluída.

## Demonstração

Vídeo: em breve.

## Referências

- Saúde: [CDC — Métodos de esterilização](https://www.cdc.gov/infection-control/hcp/disinfection-sterilization/other-sterilization-methods.html).
- Agricultura: [FDA — Irradiação de alimentos](https://www.fda.gov/food/buy-store-serve-safe-food/food-irradiation-what-you-need-know).
- Indústria: [IAEA — Radiografia industrial](https://www.iaea.org/topics/industrial-radiography).
- Pesquisa: [IAEA — Hidrologia isotópica](https://www.iaea.org/sites/default/files/publications/magazines/bulletin/bull60-1/6010405_corr.pdf).
- Energia: [IAEA — Energia nuclear e clima](https://www.iaea.org/topics/nuclear-power-and-climate-change).
- Referência de código: [App de lista das aulas](https://github.com/2TDSPB-MOBILE/app_lista).
