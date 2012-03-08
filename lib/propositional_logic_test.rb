require 'test/unit'
require 'propositional_logic'
class PropositionalLogicTest < Test::Unit::TestCase

  def setup
  end

  def test_validity
    assert "(p0)".to_proposition.valid?
    assert "(p0→p1)".to_proposition.valid?
    assert "(p0↔p1)".to_proposition.valid?
    assert "(p0∧p1)".to_proposition.valid?
    assert "(p0∨p1)".to_proposition.valid?

    assert "(¬p0)".to_proposition.valid?
    assert "(¬p0→¬p1)".to_proposition.valid?
    assert "(¬p0↔¬p1)".to_proposition.valid?
    assert "(¬p0∧¬p1)".to_proposition.valid?
    assert "(¬p0∨¬p1)".to_proposition.valid?
  end

  def test_consistency   
    assert "(p0)".to_proposition.consistent?
    assert "(p0→p1)".to_proposition.consistent?
    assert "(p0↔p1)".to_proposition.consistent?
    assert "(p0∧p1)".to_proposition.consistent?
    assert "(p0∨p1)".to_proposition.consistent?
  end

  def test_tautology
    assert "(p0→p0)".to_proposition.tautology?
    # tertium non datur
    assert "(p0∨¬p0)".to_proposition.tautology?
    assert "(p0→(p1→p0))".to_proposition.tautology?
  end

  def test_contradiction

    assert "(p0∧¬p0)".to_proposition.contradiction?
  end
  
  def test_consistency
    assert ["(p0)","(p1)"].to_propositions.consistent?
    assert ["(p0)","(¬p0∨p1)"].to_propositions.consistent?
    assert ["(p0)","(¬p0∨p1)","(p0)"].to_propositions.consistent?
    assert ! ["(p0)","(¬p0∨p1)","(¬p1)"].to_propositions.consistent?
  end

  def test_equivalency
    assert ! ["p0","p1"].to_propositions.equivalent?
    # double negation
    assert ["p0","¬¬p0"].to_propositions.equivalent?
    # laws of idempotence
    assert ["p0","(p0∧p0)"].to_propositions.equivalent?
    assert ["p0","(p0∨p0)"].to_propositions.equivalent?

    assert ["(p0→p1)","(¬p0∨p1)"].to_propositions.equivalent?
    assert ["¬(p0→p1)","(p0∧¬p1)"].to_propositions.equivalent?
    assert ["(p0→p1)","(¬p1→¬p0)"].to_propositions.equivalent?
    assert ["(p0→p1)","(¬p0∨p1)","(¬p1→¬p0)"].to_propositions.equivalent?
    assert ["(¬p1→¬p0)","(p0→p1)"].to_propositions.equivalent?
    assert ["(p0→¬p1)","(p1→¬p0)"].to_propositions.equivalent?
    assert ["(¬p0→p1)","(¬p1→p0)"].to_propositions.equivalent?
    # contraposition
    assert ["(p0↔p1)","((p0→p1)∧(p1→p0))"].to_propositions.equivalent?
    assert ["(p0↔p1)","((p0∧p1)∨(¬p0∧¬p1))"].to_propositions.equivalent?
    assert ["(p0↔p1)","((p0→p1)∧(p1→p0))","((p0∧p1)∨(¬p0∧¬p1))"].to_propositions.equivalent?
    # commutativity
    assert ["(p0∧p1)","(p1∧p0)"].to_propositions.equivalent?
    assert ["(p0∨p1)","(p1∨p0)"].to_propositions.equivalent?
    # De Morgan
    assert ["¬(p0∧p1)","(¬p0∨¬p1)"].to_propositions.equivalent?
    assert ["¬(p0∨p1)","(¬p0∧¬p1)"].to_propositions.equivalent?
    # association
    assert ["(p0∧(p1∧p2))","((p0∧p1)∧p2)"].to_propositions.equivalent?
    assert ["(p0∨(p1∨p2))","((p0∨p1)∨p2)"].to_propositions.equivalent?
    # distribution
    assert ["(p0∧(p1∨p2))","((p0∧p1)∨(p0∧p2))"].to_propositions.equivalent?
    assert ["(p0∨(p1∧p2))","((p0∨p1)∧(p0∨p2))"].to_propositions.equivalent?

  end

  def test_consequence
    assert "p0".to_proposition.consequence_of?(["p0"])
    assert "p0".to_proposition.consequence_of?(["(p0∨p1)","¬p1"])
    assert "p0".to_proposition.consequence_of?(["(p0∨p1)","¬p1"])
    assert "(p0→p2)".to_proposition.consequence_of?(["(p0→p1)","(p1→p2)"])

    assert ! "p0".to_proposition.consequence_of?(["p1"])
    assert ! "p0".to_proposition.consequence_of?(["¬p0"])
  end
  
  def test_compatibility
    assert "p0".to_proposition.compatible_with?(["p1"])
    assert ! "p0".to_proposition.compatible_with?(["¬p0"])
  end
end