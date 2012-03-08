require 'rubygems'
require 'treetop'
require 'test/unit'
class PropositionalLogicTreetopTest < Test::Unit::TestCase

  def setup
    Treetop.load "propositional_logic"
    @parser = PropositionalLogicParser.new
  end

  def test_valid_atoms
    for i in (0..9)
      assert @parser.parse("(p#{i})")
    end
  end

  def test_simple_formulas
    assert @parser.parse("(T)")
    assert @parser.parse("(⊥)")
    assert @parser.parse("(p0)")
    assert @parser.parse("(p0→p1)")
    assert @parser.parse("(p0↔p1)")
    assert @parser.parse("(p0∧p1)")
    assert @parser.parse("(p0∨p1)")

    assert @parser.parse("(¬p0)")
    assert @parser.parse("(¬p0→¬p1)")
    assert @parser.parse("(¬p0↔¬p1)")
    assert @parser.parse("(¬p0∧¬p1)")
    assert @parser.parse("(¬p0∨¬p1)")
  end

  def test_complex_formulas
    assert @parser.parse("((p0→p1)↔p1)")
    assert @parser.parse("(p1↔(p0→p1))")
    assert @parser.parse("((p4∨p1)∧(p0↔p1))")
    assert @parser.parse("((p4∧p1)∨(p0→p1))")

    assert @parser.parse("((¬p0→p1)↔p1)")
    assert @parser.parse("(p1↔(¬p0→¬p1))")
    assert @parser.parse("((p4∨¬p1)∧(¬p0↔p1))")
    assert @parser.parse("(¬(¬p4∧¬p1)∨(¬p0→¬p1))")
    assert @parser.parse("¬(¬(¬p4∧¬p1)∨(¬p0→¬p1))")

    assert @parser.parse("(((¬p0→p1)↔p1)∨((p4∧p1)∨(p0→p1)))")
    assert @parser.parse("((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬((((((p0→p1)↔((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧((((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1)))))→p1))))))∨(p0→(p0→p1))))↔(((((p0→p1)↔p1)→(¬p0∨¬p1))↔p1)∨((((p4∨¬p1)∧((p4∨¬p1)∧(¬p0↔p1)))∧p1)∨(p0→(p0→p1)))))")

  end


  def test_eval_atoms
    data = [
      {'T' => true,  :result => true }
    ]
    assert_equal data, @parser.parse("(T)").truth_table

    data = [
      {'⊥' => false,  :result => false }
    ]
    assert_equal data, @parser.parse("(⊥)").truth_table
    
    data = [
      {'T' => true,  :result => false }
    ]
    assert_equal data, @parser.parse("(¬T)").truth_table

    data = [
      {'⊥' => false,  :result => true }
    ]
    assert_equal data, @parser.parse("(¬⊥)").truth_table

    data = [
      {'⊥' => false, 'p0' => true,  :result => true },
      {'⊥' => false, 'p0' => false,  :result => true },
    ]
    assert_equal data, @parser.parse("(⊥→p0)").truth_table

    data = [
      {'T' => true, 'p0' => true,  :result => true },
      {'T' => true, 'p0' => false,  :result => false },
    ]
    assert_equal data, @parser.parse("(T→p0)").truth_table

    data = [
      {'p0' => true,  :result => true },
      {'p0' => false, :result => false }
    ]
    assert_equal data, @parser.parse("(p0)").truth_table # formula.e('p0' => true)

    data = [
      {'p0' => true,  :result => false },
      {'p0' => false, :result => true }
    ]
    assert_equal data, @parser.parse("(¬p0)").truth_table # formula.e('p0' => true)
    assert_equal data, @parser.parse("¬(p0)").truth_table # formula.e('p0' => true)


    data = [
      {'p0' => true,  'p2' => true,   :result => true },
      {'p0' => true,  'p2' => false,  :result => false},
      {'p0' => false, 'p2' => true,   :result => true },
      {'p0' => false, 'p2' => false,  :result => true }
    ]
    assert_equal data,@parser.parse("(p0→p2)").truth_table # formula.e('p0' => true)
    data = [
      {'p0' => true,  'p2' => true,   :result => false},
      {'p0' => true,  'p2' => false,  :result => true},
      {'p0' => false, 'p2' => true,   :result => false},
      {'p0' => false, 'p2' => false,  :result => false}
    ]
    assert_equal data,@parser.parse("¬(p0→p2)").truth_table # formula.e('p0' => true)

    data = [
      {'p0' => true,  'p2' => true,   :result => true },
      {'p0' => true,  'p2' => false,  :result => false},
      {'p0' => false, 'p2' => true,   :result => false},
      {'p0' => false, 'p2' => false,  :result => true }
    ]
    assert_equal data,@parser.parse("(p0↔p2)").truth_table # formula.e('p0' => true)
    data = [
      {'p0' => true,  'p2' => true,   :result => false},
      {'p0' => true,  'p2' => false,  :result => true },
      {'p0' => false, 'p2' => true,   :result => true },
      {'p0' => false, 'p2' => false,  :result => false}
    ]
    assert_equal data,@parser.parse("¬(p0↔p2)").truth_table # formula.e('p0' => true)

    data = [
      {'p0' => true,  'p2' => true,   :result => true },
      {'p0' => true,  'p2' => false,  :result => true },
      {'p0' => false, 'p2' => true,   :result => true },
      {'p0' => false, 'p2' => false,  :result => false}
    ]
    assert_equal data,@parser.parse("(p0∨p2)").truth_table # formula.e('p0' => true)
    data = [
      {'p0' => true,  'p2' => true,   :result => false},
      {'p0' => true,  'p2' => false,  :result => false},
      {'p0' => false, 'p2' => true,   :result => false},
      {'p0' => false, 'p2' => false,  :result => true }
    ]
    assert_equal data,@parser.parse("¬(p0∨p2)").truth_table # formula.e('p0' => true)

    data = [
      {'p0' => true,  'p2' => true,   :result => true },
      {'p0' => true,  'p2' => false,  :result => false},
      {'p0' => false, 'p2' => true,   :result => false},
      {'p0' => false, 'p2' => false,  :result => false}
    ]
    assert_equal data,@parser.parse("(p0∧p2)").truth_table # formula.e('p0' => true)
    data = [
      {'p0' => true,  'p2' => true,   :result => false},
      {'p0' => true,  'p2' => false,  :result => true },
      {'p0' => false, 'p2' => true,   :result => true },
      {'p0' => false, 'p2' => false,  :result => true }
    ]
    assert_equal data,@parser.parse("¬(p0∧p2)").truth_table # formula.e('p0' => true)


    data = [
      {'p0' => true,  :result => true},
      {'p0' => false, :result => false},
    ]
    ## right atoms
    assert_equal data,@parser.parse("(p0∧p0)").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("((p0∧p0)∧p0)").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("(((p0∧p0)∧p0)∧p0)").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("((((p0∧p0)∧p0)∧p0)∧p0)").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("(((((p0∧p0)∧p0)∧p0)∧p0)∧p0)").truth_table # formula.e('p0' => true)
    ## left atoms
    assert_equal data,@parser.parse("(p0∧(p0∧p0))").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("(p0∧(p0∧(p0∧p0)))").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("(p0∧(p0∧(p0∧(p0∧p0))))").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("(p0∧(p0∧(p0∧(p0∧(p0∧p0)))))").truth_table # formula.e('p0' => true)
    ## only formulas
    assert_equal data,@parser.parse("((p0∧p0)∧(p0∧p0))").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("(((p0∧p0)∧(p0∧p0))∧(p0∧p0))").truth_table # formula.e('p0' => true)
    assert_equal data,@parser.parse("(((p0∧p0)∧(p0∧p0))∧((p0∧p0)∧(p0∧p0)))").truth_table # formula.e('p0' => true)

    data = [
      {'p0' => true,  :result => false},
      {'p0' => false, :result => false},
    ]
    assert_equal data,@parser.parse("(p0∧¬p0)").truth_table # formula.e('p0' => true)

    data = [
      {'p0' => true,  :result => true},
      {'p0' => false, :result => true},
    ]
    assert_equal data,@parser.parse("(p0∨¬p0)").truth_table
    assert_equal data,@parser.parse("((p0∨¬p0)→(p0∨¬p0))").truth_table
    data = [
      {'p0' => true,  :result => true},
      {'p0' => false, :result => false},
    ]
    assert_equal data,@parser.parse("((p0∨¬p0)→p0)").truth_table

    data = [
      {'p0' => true,  'p3' => true,   :result => true},
      {'p0' => true,  'p3' => false,  :result => false},
      {'p0' => false, 'p3' => true,   :result => true},
      {'p0' => false, 'p3' => false,  :result => false}
    ]
    assert_equal data,@parser.parse("((p0∨¬p0)→p3)").truth_table
    
    data = [
      {'p0' => true,  'p3' => true,  'p4' => true, :result => true},
      {'p0' => true,  'p3' => true,  'p4' => false, :result => true},

      {'p0' => true,  'p3' => false, 'p4' => true, :result => true},
      {'p0' => true,  'p3' => false, 'p4' => false, :result => false},

      {'p0' => false, 'p3' => true,  'p4' => true, :result => true},
      {'p0' => false, 'p3' => true,  'p4' => false, :result => true},

      {'p0' => false, 'p3' => false, 'p4' => true, :result => true},
      {'p0' => false, 'p3' => false, 'p4' => false, :result => false}

    ]
    assert_equal data,@parser.parse("((p0∨¬p0)→(p3∨p4))").truth_table

  end

end

