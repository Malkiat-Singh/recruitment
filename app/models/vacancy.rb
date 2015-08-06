class Vacancy < ActiveRecord::Base
  
  has_and_belongs_to_many :skills, join_table: :vacancies_skills
  validates :name, :expire_at, :salary, :contacts, presence: true
  validates :salary, numericality: true

end
