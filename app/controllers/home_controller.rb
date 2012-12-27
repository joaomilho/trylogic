# require 'treetop'
# require "#{Rails.root}/lib/propositional_logic"

class HomeController < ApplicationController

  def jq
  end


  def index
  end

  def evaluate
  	# Treetop.load "propositional_logic"
    # @parser = PropositionalLogicParser.new
    # raise Proposition.inspect
    commands = params[:line].split(/\s+/)
    # return render json: {valid: true, truth_table: "<span>#{commands.inspect}</span>"}

    output = commands.size == 1 ? "tt" : commands.shift
    
    render json: case output
    when "consistent?", "tautology?", "contradiction?"
      is? output, commands.shift
    when "compatible?"
      compatible? commands
    when "consequence?"
      consequence? commands
    else
      tt commands.shift
    end

  end

  def tt command
    @formula = Proposition.new(command)
    if @formula.valid?
      tt = render_to_string 'truth_table', layout: false
      {valid: true, truth_table: tt} 
    else
      {valid: false} 
    end
  # rescue => e
  #   {valid: false} 
  end
  def is? is, command
    @formula = Proposition.new(command)
    if @formula.valid?
      {valid: true, truth_table: (@formula.send(is) ? %[<div class="yes">Yes</div>] : %[<div class="no">No</div>])} 
    else
      {valid: false} 
    end
    # .truth_table
  end

  def compatible? commands
    @formula = Proposition.new(commands.shift)
    # @formulas = Propositions.new(commands)
    if @formula.valid?
      {valid: true, truth_table: (@formula.compatible?(commands) ? %[<div class="yes">Yes</div>] : %[<div class="no">No</div>])} 
    else
      {valid: false} 
    end    
  rescue => e
    {valid: false} 
  end

  def consequence? commands
    @formula = Proposition.new(commands.pop)
    # @formulas = Propositions.new(commands)
    if @formula.valid?
      {valid: true, truth_table: (@formula.consequence?(commands) ? %[<div class="yes">Yes</div>] : %[<div class="no">No</div>])} 
    else
      {valid: false} 
    end
  # rescue => e
    # {valid: false} 
  end
end
