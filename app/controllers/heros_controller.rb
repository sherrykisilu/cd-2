class HerosController < ApplicationController
    def index
        heros = Hero.all
        render json: heros, only: [:id, :name, :super_name]
    end
    
    def show
        hero = Hero.find(params[:id])
        if hero
          render json: hero, include: { powers: { only: [:id, :name, :description] } }
        else
          render json: { error: 'Hero not found' }, status: :not_found
        end
    end
end
