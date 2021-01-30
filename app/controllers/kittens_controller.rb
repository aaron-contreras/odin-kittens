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
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, success: 'Kitten succesfully created.'
    else
      render :new, alert: 'An error occured while creating this kitten.' 
    end  
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, success: 'Kitten succesfully updated.'
    else
      render :edit, alert: 'An error occured while udpating this kitten.'
    end
  end
  
  def destroy
    
  end
  
  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
