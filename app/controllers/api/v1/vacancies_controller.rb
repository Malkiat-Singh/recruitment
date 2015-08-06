class Api::V1::VacanciesController < ApplicationController

  def index
    @vacancies = Vacancy.all

    render json: @vacancies
  end

  def show
    @vacancy = Vacancy.find(params[:id])

    render json: @vacancy
  end

  def workers
    @vacancy = Vacancy.find(params[:id])  
    @skills = @vacancy.skills  
    @workers = Worker.joins(:skills).where(status: 'active').where(['skills.id in (?)', @vacancy.skills.map { |e| e.id } ]).order(:salary).distinct

    strictly = params[:strictly] == "true" ? true : false
    if strictly
      @workers.each do |worker|
        @workers = @workers.reject { |a| a == worker } unless @skills.all? { |e| worker.skills.include?(e) }
      end
    end

    render json: @workers
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    handle_skills 
    if @vacancy.save
      render json: @vacancy, status: :created
    else
      render json: @vacancy.errors, status: :unprocessable_entity
    end
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    handle_skills
    if @vacancy.update(vacancy_params)
      head :no_content
    else
      render json: @vacancy.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vacancy = Vacancy.find(params[:id])
    @vacancy.destroy

    head :no_content
  end

  def handle_skills
    @vacancy.skills.clear
    if params[:vacancy][:skills]
      params[:vacancy][:skills].each do |skill|
        @vacancy.skills << Skill.where(name: skill['name']).first_or_create
      end
    end
  end

  private
    
    def vacancy_params
      params[:vacancy].permit(:name, :expire_at, :salary, :contacts, skills:[])
    end
end
