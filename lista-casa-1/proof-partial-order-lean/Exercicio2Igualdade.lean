import Mathlib

variable {P : Type*} [PartialOrder P]
variable {a b : P}

-- Versão 1: a volta é demonstrada por contradição.
theorem igualdade_indireta :
    (∀ x : P, x ≤ a ↔ x ≤ b) ↔ a = b := by
  constructor                           -- Separa o ↔ externo nas direções de ida e de volta.
  · intro h                             -- Hipótese h : ∀ x, x ≤ a ↔ x ≤ b; objetivo: a = b.
    have ha : a ≤ a ↔ a ≤ b := h a      -- Instancia h em x := a.
    have haa : a ≤ a := le_rfl          -- Reflexividade da ordem: a ≤ a.
    have hab : a ≤ b := ha.mp haa       -- Usa a direção (→) de ha para obter a ≤ b.
    have hb : b ≤ a ↔ b ≤ b := h b      -- Instancia h em x := b.
    have hbb : b ≤ b := le_rfl          -- Reflexividade da ordem: b ≤ b.
    have hba : b ≤ a := hb.mpr hbb      -- Usa a direção (←) de hb para obter b ≤ a.
    exact le_antisymm hab hba           -- Antissimetria de hab e hba produz a = b.
  · intro heq                           -- Hipótese heq : a = b; objetivo: ∀ x, x ≤ a ↔ x ≤ b.
    classical                           -- Disponibiliza a lógica clássica usada por by_contra.
    by_contra hneg                      -- Hipótese hneg nega o objetivo; novo objetivo: False.
    subst b                             -- Substitui b por a; hneg passa a negar ∀ x, x ≤ a ↔ x ≤ a.
    apply hneg                          -- Para obter False, basta provar a proposição negada por hneg.
    intro x                             -- Toma x : P arbitrário; objetivo: x ≤ a ↔ x ≤ a.
    exact Iff.rfl                       -- Reflexividade do ↔ fecha o objetivo Q ↔ Q.

-- Versão 2: a volta é demonstrada por substituição direta.
theorem igualdade_indireta_substituicao :
    (∀ x : P, x ≤ a ↔ x ≤ b) ↔ a = b := by
  constructor                           -- Separa o ↔ externo nas direções de ida e de volta.
  · intro h                             -- Hipótese h : ∀ x, x ≤ a ↔ x ≤ b; objetivo: a = b.
    have ha : a ≤ a ↔ a ≤ b := h a      -- Instancia h em x := a.
    have haa : a ≤ a := le_rfl          -- Reflexividade da ordem: a ≤ a.
    have hab : a ≤ b := ha.mp haa       -- Usa a direção (→) de ha para obter a ≤ b.
    have hb : b ≤ a ↔ b ≤ b := h b      -- Instancia h em x := b.
    have hbb : b ≤ b := le_rfl          -- Reflexividade da ordem: b ≤ b.
    have hba : b ≤ a := hb.mpr hbb      -- Usa a direção (←) de hb para obter b ≤ a.
    exact le_antisymm hab hba           -- Antissimetria de hab e hba produz a = b.
  · intro heq                           -- Hipótese heq : a = b; objetivo: ∀ x, x ≤ a ↔ x ≤ b.
    subst b                             -- Substitui b por a em todo o objetivo.
    intro x                             -- Toma x : P arbitrário; objetivo: x ≤ a ↔ x ≤ a.
    exact Iff.rfl                       -- Reflexividade do ↔ fecha o objetivo Q ↔ Q.

-- Versão 3: a volta usa explicitamente reflexividade e transitividade da ordem.
theorem igualdade_indireta_ordem :
    (∀ x : P, x ≤ a ↔ x ≤ b) ↔ a = b := by
  constructor                           -- Separa o ↔ externo nas direções de ida e de volta.
  · intro h                             -- Hipótese h : ∀ x, x ≤ a ↔ x ≤ b; objetivo: a = b.
    have ha : a ≤ a ↔ a ≤ b := h a      -- Instancia h em x := a.
    have haa : a ≤ a := le_rfl          -- Reflexividade da ordem: a ≤ a.
    have hab : a ≤ b := ha.mp haa       -- Usa a direção (→) de ha para obter a ≤ b.
    have hb : b ≤ a ↔ b ≤ b := h b      -- Instancia h em x := b.
    have hbb : b ≤ b := le_rfl          -- Reflexividade da ordem: b ≤ b.
    have hba : b ≤ a := hb.mpr hbb      -- Usa a direção (←) de hb para obter b ≤ a.
    exact le_antisymm hab hba           -- Antissimetria de hab e hba produz a = b.
  · intro heq                           -- Hipótese heq : a = b; objetivo: ∀ x, x ≤ a ↔ x ≤ b.
    have haa : a ≤ a := le_rfl          -- Reflexividade da ordem em a.
    have hbb : b ≤ b := le_rfl          -- Reflexividade da ordem em b.
    have hab : a ≤ b := by              -- Constrói a ≤ b usando haa e a igualdade.
      simpa only [heq] using haa         -- Reescreve a como b em haa e no objetivo; ambos viram b ≤ b.
    have hba : b ≤ a := by              -- Constrói b ≤ a usando hbb e a igualdade.
      simpa only [heq] using hbb         -- Reescreve a como b no objetivo, que vira b ≤ b.
    intro x                             -- Toma x : P arbitrário.
    constructor                         -- Separa o ↔ interno em suas duas implicações.
    · intro hxa                         -- Hipótese hxa : x ≤ a; objetivo: x ≤ b.
      exact le_trans hxa hab            -- Transitividade: x ≤ a e a ≤ b implicam x ≤ b.
    · intro hxb                         -- Hipótese hxb : x ≤ b; objetivo: x ≤ a.
      exact le_trans hxb hba            -- Transitividade: x ≤ b e b ≤ a implicam x ≤ a.
