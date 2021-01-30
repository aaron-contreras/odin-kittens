# frozen_string_literal: true

class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])  
  end

  def new
    @kitten = Kitten.new  
  end
  
  def create
    
  end

  def edit
    
  end

  def update

  end
  
  def destroy
    
  end
end
