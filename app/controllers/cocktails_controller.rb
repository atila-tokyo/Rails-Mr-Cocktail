class CocktailsController < ApplicationController
before_action :set_cocktail, only: %i[show edit update destroy]

  def index
    @cocktails = Cocktail.all
    # @search = params[:search][:name]
    @search = params.dig :search, :name
    @cocktails = Cocktail.where('lower(name) like ?', "%#{@search[:name].downcase}") if @search.present?
  end

  def show; end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

      if @cocktail.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  def edit; end

  def update
    @cocktail.update(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
