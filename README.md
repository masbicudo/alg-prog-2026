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

A primeira lista inclui demonstrações sobre ordens parciais formalizadas em Lean 4 e Mathlib:

- caracterização equivalente de um candidato ao meet;
- igualdade indireta em ordens parciais, verificada por três abordagens.

## Para a posteridade

Formalizar uma prova obriga cada hipótese escondida no papel a aparecer. O Lean não substitui a ideia matemática: ele registra com precisão onde usamos reflexividade, transitividade, antissimetria, igualdade e princípios lógicos.

O objetivo deste repositório é preservar não apenas respostas, mas também o caminho percorrido até elas — incluindo as escolhas de formalização que tornam um argumento verificável e reproduzível.

## Estrutura inicial

```text
lista-casa-1/
└── proof-partial-order-lean/
    ├── Exercicio1Meet.lean
    ├── Exercicio2Igualdade.lean
    ├── instructions.txt
    ├── lakefile.toml
    └── lean-toolchain
```
