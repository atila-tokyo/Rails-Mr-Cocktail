class DosesController < ApplicationController
before_action :set_dose, only: %i[show edit update destroy]
  def index
    @doses = Dose.all
    # @search = params[:search][:name]
    @search = params.dig :search, :name
    @doses = Dose.where('lower(name) like ?', "%#{@search[:name].downcase}") if @search.present?
  end

  def show; end
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to @dose
      else
        render :new
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: "Successfuly deleted"
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
