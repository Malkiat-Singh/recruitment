# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skills = ["Ruby", "Rails", "Php", "Java", "Javascript", "Css", "Html", "Delphi", "Pascal"]
names = [
  "Белкин Вениамин Павлович",
  "Беляшин Василий Васильевич",
  "Бенуа Александр Николаевич",
  "Бехтеев Владимир Георгиевич",
  "Билибин Иван Яковлевич",
  "Бобровский Григорий Михайлович",
  "Бобышов Михаил Павлович",
  "Богаевский Константин Фёдорович",
  "Богуславская Ксения Леонидовна",
  "Богородский Фёдор Семёнович",
  "Борисов Виктор Эльпидифорович",
  "Браз Осип Эммануилович",
  "Бродский Исаак Израилевич",
  "Бубнова Варвара Дмитриевна",
  "Бурлюк Владимир Давидович",
  "Бурлюк Давид Давидович"
]

puts "Creating skills..."
skills.each do |skill|
  Skill.create!(name:skill)
end

puts "Creating vacancies..."
10.times do |t|
  t = t + 1
  v = Vacancy.create!(
    name: "Vacancy #{t}",
    expire_at: 2.month.from_now,
    salary: 100 * t,
    contacts: "example@mail.ru"
  )
  v.skills << Skill.order("RANDOM()").limit(t)
  v.save
end

puts "Creating workers..."
t = 0
names.each do |name|
  t = t + 1
  w = Worker.create!(
    name: name,
    salary: 200 * t,
    contacts: "example@mail.ru"
  )
  w.skills << Skill.order("RANDOM()").limit(t)
  w.save
end

