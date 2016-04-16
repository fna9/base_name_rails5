# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.find_by_email("bolonka94@gmail.com")
if u.blank?
  u = User.create(email: "bolonka94@gmail.com", password: "123", password_confirmation: "123")
  u.activation_state = 'active'
  u.save
end

r1 = Role.create(name: 'Преподаватель', short_name: 'Преподаватель')

r2 = Role.create(name: 'Администратор', short_name: 'Админ')

r3 = Role.create(name: 'Студент', short_name: 'Студент')

RoleUser.create(role: r1, user: u)
RoleUser.create(role: r2, user: u)
RoleUser.create(role: r3, user: u)


uni1 = University.create(name: 'МАМИ', full_name: "Московский государственный машиностроительный университет")
uni2 = University.create(name: 'МГИУ', full_name: "Московский государственный индустриальный университет")

t1 = Teacher.create(last_name: 'Белова', first_name: 'Ирина', second_name: 'Михайловна', b_date: Date.new(1953, 03, 16), degree: 'к.т.н.', rank: 'Доцент', position: 'Заведующая кафедрой')
t2 = Teacher.create(last_name: 'Иванова', first_name: 'Елена', second_name: 'Михайловна', b_date: Date.new(1989, 07, 23), degree: '-', rank: '-', position: 'Старший преподаватель')
t3 = Teacher.create(last_name: 'Мурзаев', first_name: 'Григорий', second_name: 'Дмитриевич', b_date: Date.new(1980, 05, 03), degree: 'к.т.н.', rank: 'Доцент', position: 'Старший преподаватель')
t4 = Teacher.create(last_name: 'Петров', first_name: 'Денис', second_name: 'Сергеевич', b_date: Date.new(1972, 07, 29), degree: '-', rank: '-', position: 'Преподаватель')
t5 = Teacher.create(last_name: 'Александрова', first_name: 'Нина', second_name: 'Григорьевна', b_date: Date.new(1989, 10, 9), degree: '-', rank: '-', position: 'Ассистент')

#puts t1.errors.inspect
s1 = Student.create(last_name: 'Фомина', first_name: 'Наталья', second_name: 'Александровна', b_date: Date.new(1994, 10, 9))
s2 = Student.create(last_name: 'Стрельская', first_name: 'Дарья', second_name: 'Александровна', b_date: Date.new(1995, 03, 14))
s3 = Student.create(last_name: 'Седых', first_name: 'Дмитрий', second_name: 'Владимирович', b_date: Date.new(1994, 03, 26))
s4 = Student.create(last_name: 'Фомин', first_name: 'Валерий', second_name: 'Алексеевич', b_date: Date.new(1995, 8, 11))
s5 = Student.create(last_name: 'Умурзакова', first_name: 'Алина', second_name: 'Станиславовна', b_date: Date.new(1994, 12, 16))

g1 = Group.create(title: '121131', course: '4', semester: '8')
g2 = Group.create(title: '7-ОЗПНнс-3', course: '4', semester: '8')
g3 = Group.create(title: '5-ОЗИВТн-4', course: '3', semester: '6')
g4 = Group.create(title: '9-ЗУТСн', course: '5', semester: '10')
g5 = Group.create(title: '121232', course: '3', semester: '6')

sb1 = Subject.create(title: 'Математический анализ', s_type: 'Лекции', type_of_reporting: 0)
sb2 = Subject.create(title: 'Алгебра и начало анализа', s_type: 'Семенар', type_of_reporting: 0)
sb3 = Subject.create(title: 'Компьютерная графика', s_type: 'Семинар', type_of_reporting: 1)
sb4 = Subject.create(title: 'Веб-технологии', s_type: 'Семинар', type_of_reporting: 0)
sb5 = Subject.create(title: 'Программирование', s_type: 'Лекции', type_of_reporting: 3)

