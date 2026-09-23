# Álgebra para Programação — 2026.2

Repositório de estudos, exercícios e formalizações desenvolvidos para a disciplina de Álgebra para Programação.

## Identificação

- **Aluno:** Miguel Angelo
- **Professor:** João Paixão
- **Disciplina:** Álgebra para Programação
- **Período:** 2026.2
- **Local:** CCMN — UFRJ, Bloco F, sala F3-010

## Conteúdo

Cada lista possui sua própria pasta. Projetos de verificação formal em Lean ficam dentro da lista correspondente, acompanhados das instruções, do toolchain e das dependências necessárias para reproduzir as provas.

- **[Lista de Casa 1](lista-casa-1/README.md)** — exercícios e fotos do desenvolvimento, acompanhados de formalizações em Lean 4 e Mathlib sobre a caracterização equivalente de um candidato ao meet e a igualdade indireta em ordens parciais, esta verificada por três abordagens.

## Sobre este repositório

Formalizar uma prova obriga cada hipótese escondida no papel a aparecer. O Lean não substitui a ideia matemática: ele registra com precisão onde usamos reflexividade, transitividade, antissimetria, igualdade e princípios lógicos.

O objetivo deste repositório é preservar não apenas respostas, mas também o caminho percorrido até elas — incluindo as escolhas de formalização que tornam um argumento verificável e reproduzível.

## Aviso sobre o conteúdo

Este repositório é um registro de estudo. As resoluções manuscritas, interpretações e demais materiais são publicados como foram produzidos pelo aluno e podem conter erros. Não há garantia de corretude matemática ou de adequação das respostas aos enunciados originais.

Os arquivos Lean confirmam apenas que as proposições neles formalizadas são aceitas pelo verificador sob as hipóteses declaradas; isso não substitui a revisão do enunciado, da modelagem escolhida ou das soluções manuscritas.

## Licença

Copyright 2026 Miguel Angelo. Este repositório é disponibilizado sob a [Licença Apache 2.0](LICENSE).

## Estrutura inicial

```text
lista-casa-1/
├── README.md
├── fotos-desenvolvimento/
└── proof-partial-order-lean/
    ├── Exercicio1Meet.lean
    ├── Exercicio2Igualdade.lean
    ├── instructions.txt
    ├── lakefile.toml
    └── lean-toolchain
```
