class CreateVacanciesSkills < ActiveRecord::Migration
  def change
    create_table :vacancies_skills, :id => false  do |t|
        t.references :vacancy
        t.references :skill   
    end
  end
end
