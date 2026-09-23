import Mathlib

variable {P : Type*} [PartialOrder P]

-- Exercício 1: caracterização de um candidato arbitrário m ao meet de A e B.
-- Usar m, em vez de assumir previamente as leis de A ⊓ B, evita circularidade.
theorem caracterizacao_meet {A B m : P} :
    (∀ x : P, (x ≤ A ∧ x ≤ B) ↔ x ≤ m) ↔
      ((m ≤ A ∧ m ≤ B) ∧
       ∀ x : P, (x ≤ A ∧ x ≤ B) → x ≤ m) := by
  constructor                           -- Separa o ↔ externo nas duas implicações.
  · intro hspec                         -- Supõe a especificação; objetivo: provar conjuntamente I e II.
    constructor                         -- Separa o objetivo externo I ∧ II.
    · have hm : (m ≤ A ∧ m ≤ B) ↔ m ≤ m := hspec m
                                          -- Instancia a especificação em x := m.
      have hmm : m ≤ m := le_rfl       -- Reflexividade da ordem em m.
      exact hm.mpr hmm                   -- A direção (←) fornece I: m ≤ A ∧ m ≤ B.
    · intro x hx                       -- Para II, toma x e supõe x ≤ A ∧ x ≤ B.
      exact (hspec x).mp hx             -- A direção (→) da especificação fornece x ≤ m.
  · intro hprops                       -- Supõe o par de propriedades I e II.
    have hI : m ≤ A ∧ m ≤ B := hprops.1
                                          -- Extrai I do primeiro componente da conjunção externa.
    have hII : ∀ x : P, (x ≤ A ∧ x ≤ B) → x ≤ m := hprops.2
                                          -- Extrai II do segundo componente da conjunção externa.
    intro x                             -- Toma x : P arbitrário para reconstruir a especificação.
    constructor                         -- Separa o ↔ interno em suas duas implicações.
    · exact hII x                       -- Esta direção é literalmente a Eq. II instanciada em x.
    · intro hxm                         -- Supõe x ≤ m; objetivo: x ≤ A ∧ x ≤ B.
      constructor                       -- Separa a conjunção interna em seus dois componentes.
      · exact le_trans hxm hI.1         -- Transitividade: x ≤ m e m ≤ A implicam x ≤ A.
      · exact le_trans hxm hI.2         -- Transitividade: x ≤ m e m ≤ B implicam x ≤ B.
