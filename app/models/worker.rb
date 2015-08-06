class Worker < ActiveRecord::Base
  
  has_and_belongs_to_many :skills, join_table: :workers_skills

  validates :contacts, :status, :salary, presence: true
  validates :salary, numericality: true
  
  validates_format_of :contacts, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})|\+\d{9,15}\z/, message: "must be phone number or email"
  validates_format_of :name, :with => /[а-яА-Я]+[а-яА-Я]\z/, message: "must be in Russian"
  validates :name, presence: true, length: {
    is: 3,
    tokenizer: lambda { |str| str.split },
    message: "must have %{count} words"
  }

  enum status: %w(active inactive)

end


