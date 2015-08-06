FactoryGirl.define do
  factory :vacancy do
    name "Vacancy Title"
    expire_at 1.month.from_now
    salary 100000
    contacts "example@mail.com"
    created_at 1.day.ago
  end

end
