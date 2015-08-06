class Api::V1::SkillsController < ApplicationController

  def index
    @skills = Skill.all

    render json: @skills
  end

  def show
    @skill = Skill.find(params[:id])

    render json: @skill
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      render json: @skill, status: :created
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update(skill_params)
      head :no_content
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    head :no_content
  end

  private
    
    def skill_params
      params[:skill].permit(:name)
    end
end
