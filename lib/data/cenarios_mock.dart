import 'package:nexo/models/alternativa.dart';
import 'package:nexo/models/cenario.dart';

// Cenários fictícios. Os IDs permanecem estáveis para o alinhamento do grupo.
const cenariosMock = <Cenario>[
  Cenario(
    id: 1,
    titulo: 'Cuidar começa antes do uso',
    categoria: 'Saúde',
    situacao:
        'Uma fabricante precisa esterilizar um lote de materiais médicos '
        'sensíveis ao calor. A equipe precisa investigar um processo que reduza '
        'microrganismos sem comprometer o material. Por onde começar?',
    objetivoEducacional: 'Entender por que a escolha de um método de esterilização depende do material e do processo.',
    alternativas: [
      Alternativa(
        id: 101,
        cenarioId: 1,
        rotulo: 'A',
        descricao: 'Investigar a esterilização por radiação ionizante.',
        consequencia:
            'Você escolheu investigar um processo de baixa temperatura '
            'utilizado na esterilização industrial de produtos médicos. Antes '
            'de adotá-lo, a fabricante precisa validar o processo e verificar '
            'se o material mantém suas propriedades.',
        beneficio: 'Pode tratar produtos sensíveis ao calor e atender operações em grande escala.',
        limitacao: 'Nem todo material é compatível. O processo exige instalações apropriadas, controle e validação.',
      ),
      Alternativa(
        id: 102,
        cenarioId: 1,
        rotulo: 'B',
        descricao: 'Investigar a esterilização por vapor.',
        consequencia:
            'Você escolheu avaliar um método amplamente utilizado '
            'para materiais compatíveis com calor e umidade. Neste cenário, '
            'a sensibilidade ao calor é um sinal para verificar a compatibilidade '
            'antes de escolher o vapor.',
        beneficio: 'É uma opção relevante para produtos que suportam as condições do processo.',
        limitacao: 'O calor e a umidade podem danificar materiais sensíveis; não se deve presumir compatibilidade.',
      ),
    ],
    afirmacao: 'Um único método de esterilização serve para qualquer material.',
    ehMito: true,
    explicacao:
        'A composição do produto, sua finalidade e as condições do '
        'processo precisam ser avaliadas. Radiação também não é uma solução universal.',
    fonteTitulo: 'CDC — Guideline for Disinfection and Sterilization',
    fonteUrl: 'https://www.cdc.gov/infection-control/hcp/disinfection-sterilization/other-sterilization-methods.html',
  ),
  Cenario(
    id: 2,
    titulo: 'Uma colheita, mais possibilidades',
    categoria: 'Agricultura',
    situacao:
        'Uma cooperativa quer reduzir perdas e microrganismos em parte '
        'da produção. Ela já utiliza boas práticas de higiene, armazenamento '
        'e transporte. Qual caminho você investigaria para melhorar a conservação?',
    objetivoEducacional: 'Reconhecer a irradiação como uma ferramenta complementar na conservação de alimentos.',
    alternativas: [
      Alternativa(
        id: 201,
        cenarioId: 2,
        rotulo: 'A',
        descricao: 'Avaliar a irradiação como complemento às boas práticas.',
        consequencia:
            'A cooperativa passa a estudar um processo que pode reduzir '
            'microrganismos e insetos e prolongar a conservação. É preciso avaliar '
            'o alimento, as condições autorizadas de tratamento e a viabilidade '
            'do serviço. Higiene e armazenamento continuam necessários.',
        beneficio: 'Pode contribuir para a segurança e conservação de determinados alimentos.',
        limitacao: 'Não substitui boas práticas nem impede contaminação posterior. A aplicação depende do produto e das regras locais.',
      ),
      Alternativa(
        id: 202,
        cenarioId: 2,
        rotulo: 'B',
        descricao:
            'Aprimorar a conservação convencional e avaliar seus limites.',
        consequencia:
            'Você priorizou revisar higiene, transporte e conservação '
            'adequada ao alimento. A equipe pode identificar melhorias nessas '
            'etapas e comparar os resultados com outras opções, incluindo a irradiação.',
        beneficio: 'Aproveita a estrutura existente e reforça práticas necessárias em qualquer estratégia.',
        limitacao: 'Pode não resolver todos os problemas de microrganismos ou insetos do produto; os resultados precisam ser acompanhados.',
      ),
    ],
    afirmacao: 'A irradiação de alimentos torna o alimento radioativo.',
    ehMito: true,
    explicacao:
        'Nos processos aprovados para alimentos, irradiar não torna '
        'o produto radioativo. O alimento continua exigindo armazenamento e manipulação adequados.',
    fonteTitulo: 'FDA — Food Irradiation: What You Need to Know',
    fonteUrl: 'https://www.fda.gov/food/buy-store-serve-safe-food/food-irradiation-what-you-need-know',
  ),
  Cenario(
    id: 3,
    titulo: 'O que a solda não mostra',
    categoria: 'Indústria',
    situacao:
        'Uma equipe de qualidade suspeita de uma falha interna na solda '
        'de uma tubulação. A superfície parece intacta e a equipe quer investigar '
        'sem cortar a peça. Qual abordagem avaliar?',
    objetivoEducacional: 'Distinguir uma inspeção externa de uma técnica capaz de investigar o interior de materiais.',
    alternativas: [
      Alternativa(
        id: 301,
        cenarioId: 3,
        rotulo: 'A',
        descricao: 'Avaliar a radiografia industrial da solda.',
        consequencia:
            'Você escolheu uma técnica de ensaio não destrutivo '
            'capaz de revelar certas falhas internas. A equipe deve avaliar '
            'o material, a geometria e o defeito procurado, além de planejar '
            'a inspeção com profissionais habilitados.',
        beneficio:
            'Permite investigar o interior de uma peça sem precisar cortá-la.',
        limitacao: 'Exige proteção radiológica, controle da área e interpretação especializada; não detecta todo tipo de falha.',
      ),
      Alternativa(
        id: 302,
        cenarioId: 3,
        rotulo: 'B',
        descricao: 'Começar pela inspeção visual externa.',
        consequencia:
            'A inspeção visual pode encontrar sinais na superfície '
            'e orientar a investigação. Como a suspeita é de uma falha interna, '
            'um resultado visual normal não encerra a análise. Pode ser '
            'necessário um ensaio complementar.',
        beneficio: 'Ajuda a identificar defeitos visíveis e a planejar as próximas verificações.',
        limitacao: 'A aparência externa, sozinha, não permite descartar falhas escondidas no interior da solda.',
      ),
    ],
    afirmacao:
        'É possível investigar certas falhas internas sem destruir a peça.',
    ehMito: false,
    explicacao:
        'Ensaios não destrutivos, como a radiografia industrial, '
        'ajudam a avaliar materiais preservando a peça. A técnica deve ser adequada ao problema.',
    fonteTitulo: 'IAEA — Industrial radiography',
    fonteUrl: 'https://www.iaea.org/topics/industrial-radiography',
  ),
  Cenario(
    id: 4,
    titulo: 'A história de uma gota',
    categoria: 'Pesquisa',
    situacao:
        'Pesquisadores estudam um aquífero utilizado por uma comunidade. '
        'Eles querem compreender de onde vem a água e como ela se renova '
        'para apoiar seu uso responsável. Que investigação você propõe?',
    objetivoEducacional: 'Conhecer o uso de isótopos como pistas sobre a origem e a renovação da água.',
    alternativas: [
      Alternativa(
        id: 401,
        cenarioId: 4,
        rotulo: 'A',
        descricao: 'Combinar análise isotópica com estudos locais.',
        consequencia:
            'A equipe passa a analisar assinaturas isotópicas '
            'da água junto com informações geológicas e hidrológicas. '
            'Essas pistas ajudam a investigar origem, movimento e tempo '
            'de permanência da água no ambiente.',
        beneficio: 'Acrescenta informações sobre a história da água que complementam as medições de volume e nível.',
        limitacao: 'Exige coleta, análise e interpretação especializadas. Os resultados dependem do contexto e dos métodos utilizados.',
      ),
      Alternativa(
        id: 402,
        cenarioId: 4,
        rotulo: 'B',
        descricao: 'Acompanhar somente níveis e volumes de água.',
        consequencia:
            'Você escolheu acompanhar informações importantes '
            'sobre disponibilidade e variações do aquífero. Elas ajudam '
            'na gestão, mas podem deixar perguntas sobre origem e renovação '
            'sem resposta. A equipe pode combinar outras técnicas depois.',
        beneficio: 'Permite acompanhar mudanças na disponibilidade de água ao longo do tempo.',
        limitacao: 'Níveis e volumes, isoladamente, podem ser insuficientes para compreender a origem e a idade da água.',
      ),
    ],
    afirmacao:
        'Isótopos presentes na água podem ajudar a investigar sua origem.',
    ehMito: false,
    explicacao:
        'Diferenças nas assinaturas isotópicas funcionam como pistas '
        'do percurso da água. A pesquisa pode utilizar isótopos naturais; não é necessário adicionar material radioativo para todo estudo.',
    fonteTitulo: 'IAEA Bulletin — Isotope hydrology: an overview',
    fonteUrl: 'https://www.iaea.org/sites/default/files/publications/magazines/bulletin/bull60-1/6010405_corr.pdf',
  ),
  Cenario(
    id: 5,
    titulo: 'Energia para o próximo capítulo',
    categoria: 'Energia',
    situacao:
        'Uma região está planejando seu abastecimento elétrico e quer '
        'reduzir emissões sem perder confiabilidade. Ela ainda precisa '
        'comparar recursos locais, custos, prazos e impactos. Qual estudo iniciar?',
    objetivoEducacional: 'Entender que fontes de energia devem ser comparadas considerando benefícios e limitações.',
    alternativas: [
      Alternativa(
        id: 501,
        cenarioId: 5,
        rotulo: 'A',
        descricao: 'Incluir a energia nuclear na comparação de fontes.',
        consequencia:
            'O estudo passa a considerar uma fonte de eletricidade '
            'de baixo carbono que pode contribuir para o fornecimento '
            'contínuo. Incluí-la na análise não decide sua adoção: custos, '
            'prazos, segurança e gestão de rejeitos também precisam ser avaliados.',
        beneficio: 'Pode contribuir para reduzir emissões da geração e diversificar o abastecimento.',
        limitacao: 'Requer planejamento de longo prazo, infraestrutura, segurança e gestão de rejeitos radioativos.',
      ),
      Alternativa(
        id: 502,
        cenarioId: 5,
        rotulo: 'B',
        descricao: 'Estudar renováveis, armazenamento e melhorias na rede.',
        consequencia:
            'Você escolheu estudar uma combinação de recursos '
            'renováveis e soluções para equilibrar a oferta e o consumo. '
            'A região precisa avaliar os recursos disponíveis e a '
            'confiabilidade do conjunto antes de decidir.',
        beneficio: 'Pode aproveitar recursos locais e ampliar opções de geração com baixas emissões.',
        limitacao: 'Fontes variáveis exigem planejamento da rede, complementaridade e, conforme o sistema, armazenamento.',
      ),
    ],
    afirmacao: 'Uma fonte de baixo carbono não tem impactos ou limitações.',
    ehMito: true,
    explicacao:
        'Baixas emissões não significam ausência de impactos. '
        'A decisão exige comparar o sistema completo, seus benefícios '
        'e responsabilidades. A energia nuclear não é a melhor opção em todo contexto.',
    fonteTitulo: 'IAEA — Nuclear power and climate change',
    fonteUrl: 'https://www.iaea.org/topics/nuclear-power-and-climate-change',
  ),
];
