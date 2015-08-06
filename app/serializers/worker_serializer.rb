class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :contacts, :salary, :status

  has_many :skills

end
