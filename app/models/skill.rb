class Skill < ActiveRecord::Base

  has_and_belongs_to_many :vacancies, join_table: :vacancies_skills
  has_and_belongs_to_many :workers, join_table: :workers_skills

  validates :name, uniqueness: true, presence: true

end
