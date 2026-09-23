# Exercícios de ordem parcial em Lean 4

Projeto didático mínimo com Lean 4 e Mathlib, contendo um arquivo para cada exercício.

## Reprodução

Com `elan` e Git instalados, execute na raiz deste projeto:

```text
lake exe cache get
lake build
```

O arquivo `lean-toolchain` fixa a versão do Lean. O `lakefile.toml` fixa a
revisão direta do Mathlib, e `lake-manifest.json` fixa todas as dependências
transitivas.
