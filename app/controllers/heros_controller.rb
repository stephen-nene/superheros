# This class defines a controller for managing hero objects.
class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :update, :destroy]

  # GET /heroes - This action retrieves all heroes.
  def index
    heroes = Hero.order(id: :asc)
    render json: heroes, each_serializer: HeroSerializer, include_powers: false
  end

  # GET /heroes/1 - This action retrieves a single hero by id with the powers associated.
  def show
    render json: @hero, serializer: HeroSerializer, include_powers: true
  end

  # POST /heroes - This action creates a new hero object.
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      render json: @hero, serializer: HeroSerializer, status: :created
    else
      render json: { errors: @hero.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heroes/1 - This action updates an existing hero object by id.
  def update
    if @hero.update(hero_params)
      render json: @hero, serializer: HeroSerializer, status: :ok
    else
      render json: { errors: @hero.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1 - This action deletes a hero object by id.
  def destroy
    @hero.destroy
    head :no_content
  end

  private

  # This is a helper method used to find a specific hero object by id.
  def set_hero
    @hero = Hero.find(params[:id])
  end

  # This is a helper method used to whitelist and retrieve permitted parameters for creating/updating a hero object.
  def hero_params
    params.require(:hero).permit(:name, :super_name)
  end
end
