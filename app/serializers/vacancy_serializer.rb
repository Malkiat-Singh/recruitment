class VacancySerializer < ActiveModel::Serializer
  attributes :id, :name, :expire_at, :salary, :contacts, :created_at

  has_many :skills
  
end

