class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show edit update destroy]

  def index
    @pokemons = Pokemon.includes(:type)
  end

  def edit; end

  def show; end

  # La var @pokemon est une variable uniquement accessible par la vue
  def new
    @pokemon = Pokemon.new
  end

  # permit sert à accepter certain champs d'un formulaire. Par défaut il accepte tout ce qui dangereux.
  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to @pokemon
    else
      render 'new'
    end
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update(pokemon_params)
      redirect_to @pokemon
    else
      render 'edit'
    end
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_url
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :number, :level, :health_points, :type_id)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
