# frozen_string_literal: true

# Kittens resource controller
class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, flash: { success: 'Kitten succesfully created.' }
    else
      flash.now[:alert] = 'This kitten could not be created.'
      render :new
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, flash: { success: 'Kitten succesfully updated.' }
    else
      flash.now[:alert] = 'This kitten could not be updated.'
      render :edit
    end
  end

  def destroy
    kitten = Kitten.find(params[:id])
    if kitten.destroy
      redirect_to root_path, flash: { success: 'Kitten succesfully deleted.' }
    else
      redirect_back fallback_location: root_path,
                    flash: { alert: 'This kitten could not be deleted.' }
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
