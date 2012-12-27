# encoding: UTF-8
class Proposition

  def initialize(formula)
    @formula = formula
  end

  def parsed_formula
    return @parsed_formula if @parsed_formula
    @parser = Treetop.load("#{Rails.root}/app/models/propositional_logic").new
    # raise @parser.inspect
    # PropositionalLogicParser
    @parsed_formula = @parser.parse(@formula)
  end
  
  def to_s
    parsed_formula.text_value
  end

  def valid?
    ! parsed_formula.nil?
  end

  def truth_table
    parsed_formula.truth_table
  end

  def true_rows # or "models"
    truth_table.select{|row| row[:result] }
  end
  alias :models :true_rows

  def false_rows
    truth_table.select{|row| ! row[:result] }
  end

  def consistent?
    true_rows.any?
  end
  
  def tautology?
    false_rows.none?
  end

  def contradiction?
    ! consistent?
  end
  
  def compatible? propositions
    (propositions << @formula).to_propositions.consistent?
  end
  
  def consequence? propositions
    conjunct_all = '(' + propositions.to_propositions.consider_all + '→' + @formula + ')'
    # raise conjunct_all.inspect
    conjunct_all.to_proposition.tautology?
  end

end

class String
  def to_proposition
    Proposition.new(self)
  end
end


class Propositions

  # def each
  #   .each
  # end
  def initialize list
    @unparsed_list = list
  end
  def parse
    @parsed_list ||= @unparsed_list.map &:to_proposition
  end
  def consider_all
    @unparsed_list.inject(nil){|sum,formula| sum ? "(#{sum}∧#{formula})" : formula }
  end
  def consistent?
    consider_all.to_proposition.consistent?
  end

  def equivalent?
    # I could compare truth tables, but it will be necessary to sort them right...
    # So... I thinks it's easier if i create a biimplication of propositions and check if it
    # returns a tautology
    # The problem is that equivalency (≡) and biimplication (↔) are not the same, 'cause
    # A≡B may be equal to A↔B, but
    # A≡B≡C will not be equal to A↔B↔C, since A↔B is suposed to return a tautology this
    # tautology cannot be in a biimplication with C (of course, unless C is a tautology)
    # Finally... my strategy is to get the first formula, and biimplicate it will all the others
    # picking one by one (left associative, like Haskell's default recursion).
    copy_unparsed_list = @unparsed_list
    first_formula = copy_unparsed_list.shift
    while formula = copy_unparsed_list.shift
      return false unless "(#{first_formula}↔#{formula})".to_proposition.tautology?
    end
    true
  end

end
class Array
  def to_propositions
    Propositions.new(self)
  end
end