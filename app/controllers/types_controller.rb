class TypesController < ApplicationController
  before_action :set_type, only: %i[show edit update destroy]

  def index
    @types = Type.all
  end

  def show; end

  def new
    @type = Type.new
  end

  def edit; end

  def create
    @type = Type.new(type_params)
    if @type.save
      redirect_to @type, notice: 'Le type a bien été créé'
    else
      render :new
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    if @type.update(type_params)
      redirect_to @type, notice: 'Le type a bien été mis à jour !'
    else
      render :edit
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type.destroy
    redirect_to types_url, notice: 'Le type a bien été mis à jour !'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_type
    @type = Type.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def type_params
    params.require(:type).permit(:name, :color)
  end
end