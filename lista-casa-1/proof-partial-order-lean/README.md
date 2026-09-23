# Exercícios de ordem parcial em Lean 4

Projeto didático mínimo com Lean 4 e Mathlib, contendo um arquivo para cada exercício.

## Reprodução

Com `elan` e Git instalados, execute os comandos no diretório do projeto Lean,
`lista-casa-1/proof-partial-order-lean`. Esse diretório contém o
`lakefile.toml` e **não é a raiz do repositório Git**:

```text
cd lista-casa-1/proof-partial-order-lean
lake exe cache get
lake build
```

O arquivo `lean-toolchain` fixa a versão do Lean. O `lakefile.toml` fixa a
revisão direta do Mathlib, e `lake-manifest.json` fixa todas as dependências
transitivas.
