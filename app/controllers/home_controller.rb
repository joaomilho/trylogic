# require 'treetop'
# require "#{Rails.root}/lib/propositional_logic"

class HomeController < ApplicationController
  def index
  end

  def evaluate
  	# Treetop.load "propositional_logic"
    # @parser = PropositionalLogicParser.new
    # raise Proposition.inspect
    @formula = Proposition.new(params[:line])
    if @formula.valid?
      tt = render_to_string 'truth_table', layout: false
    	render json: {valid: true, truth_table: tt} 
    else
      render json: {valid: false} 
    end
    # .truth_table
  end
end
