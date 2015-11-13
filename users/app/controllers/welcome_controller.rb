class WelcomeController < ApplicationController
  def index

  end

  def show

  end

  def blah

  end

  def selection
  	@agi_heros = Champion.where(char_type: 'agi')
  	@str_heros = Champion.where(char_type: 'str')
  	@int_heros = Champion.where(char_type: 'int')
  end
  
end