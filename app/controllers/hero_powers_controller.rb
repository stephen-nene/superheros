class HeroPowersController < ApplicationController
  def create
    hero = Hero.find(params[:hero_id])
    power = Power.find(params[:power_id])
    hero_power = HeroPower.new(strength: params[:strength], hero: hero, power: power)

    if hero_power.save
      render json: hero.as_json(include: :powers), status: :created
    else
      render json: { errors: hero_power.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
