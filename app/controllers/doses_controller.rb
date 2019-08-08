class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]
  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(secure_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def secure_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
