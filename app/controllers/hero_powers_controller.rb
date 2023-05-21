class HeroPowersController < ApplicationController
    def create
        hero = Hero.find(params[:hero_id])
        power = Power.find(params[:power_id])
        hero_power = hero.hero_powers.build(power: power, strength: params[:strength])

        if hero_power.save
          render json: hero, include: { powers: { only: [:id, :name, :description] } }
        else
          render json: { "errors": "validation errors" }, status: :unprocessable_entity
        end
    end
end