class Api::V1::WorkersController < ApplicationController

  def index
    @workers = Worker.all

    render json: @workers
  end

  def show
    @worker = Worker.find(params[:id])
    render json: @worker
  end

  def vacancies
    @worker = Worker.find(params[:id])    
    @skills = @worker.skills
    @vacancies = Vacancy.joins(:skills).where("expire_at >= ?", Date.today.beginning_of_day).where(['skills.id in (?)', @skills.map { |e| e.id } ]).order(salary: :desc).distinct

    strictly = params[:strictly] == "true" ? true : false
    if strictly
      @vacancies.each do |vacancy|
        @vacancies = @vacancies.reject { |a| a == vacancy } unless @skills.all? { |e| vacancy.skills.include?(e) }
      end
    end

    render json: @vacancies
  end

  def create
    @worker = Worker.new(worker_params)
    handle_skills
    if @worker.save
      render json: @worker, status: :created
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  def update
    @worker = Worker.find(params[:id])
    handle_skills
    if @worker.update(worker_params)
      head :no_content
    else
      render json: @worker.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy

    head :no_content
  end

  def handle_skills
    @worker.skills.clear
    if params[:worker][:skills]
      params[:worker][:skills].each do |skill|
        @worker.skills << Skill.where(name: skill['name']).first_or_create
      end
    end
  end

  private
    
  def worker_params
    params[:worker].permit(:name, :status, :salary, :contacts, skills:[])
  end

end
