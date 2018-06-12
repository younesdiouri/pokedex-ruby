class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]

  def index
    @moves = Move.all
  end

  def show
  end

  def new
    @move = Move.new
  end


  def edit
  end

  def create
    @move = Move.new(move_params)
      if @move.save
        redirect_to @move, notice: 'Attaque ajoutée avec succès.'
      else
        render :new
      end
    end
  end

  def update
      if @move.update(move_params)
        redirect_to @move, notice: 'Attaque mise à jour avec succès.'
      else
        render :edit
      end
    end
  end

  def destroy
    @move.destroy
       redirect_to moves_url, notice: 'Attaque détruite avec succès.'
    end
  end

  private
   
    def set_move
      @move = Move.find(params[:id])
    end

  
    def move_params
      params.require(:move).permit(:name, :description, :type_id)
    end
end
