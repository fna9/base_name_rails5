# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

<<<<<<< HEAD
users = [['Гаврелюк', 'Артемий', 'Андреевич', 'gaa120@mail.msiu.ru'], 
['Фомин', 'Валерий', 'Алексеевич', 'fva12@mail.msiu.ru'],
['Фомина', 'Наталья', 'Александровна', 'fna9@mail.msiu.ru'],
['Хараборчев', 'Илья', 'Сергеевич', 'xis4@mail.msiu.ru'],
['Салкин', 'Никита', 'Юрьевич', 'snq13@mail.msiu.ru'],
['Опекунов', 'Сергей', 'Дмитриевич', 'osd2@mail.msiu.ru'],
['Стрельская', 'Дарья', 'Александровна', 'sda102@mail.msiu.ru'],
['Умурзакова', 'Алина', 'Станиславовна', 'uak2@mail.msiu.ru'],
['Мишин', 'Андрей', 'Дмитриевич', 'mad19@mail.msiu.ru'],
['Сикачев', 'Евгений', 'Александрович', 'sea83@mail.msiu.ru'],
['Седых', 'Дмитрий', 'Владимирович', 'sdv39@mail.msiu.ru'],
['Никандрова', 'Ксения', 'Сергеевна', 'nks8@mail.msiu.ru'], 
['Татаринов', 'Сергей', 'Александрович', 'tsa27@mail.msiu.ru'], 
['Хачковский', 'Алексей', 'Дмитриевич', 'xad2@mail.msiu.ru']] 

users_obj = []
users.each do |u|
  u1 = User.find_by_email(u[3])
  if u1.blank?
    u1 = User.create(email: u[3], password: "123", password_confirmation: "123")
    u1.activation_state = 'active'
    u1.save
  end
  users_obj << u1
end

=======
>>>>>>> ccc135a1ce16c208a84b581a04c6f1afd0263dbf
u1 = User.find_by_email("bolonka94@gmail.com")
if u1.blank?
  u1 = User.create(email: "bolonka94@gmail.com", password: "123", password_confirmation: "123")
  u1.activation_state = 'active'
  u1.save
end

<<<<<<< HEAD
u2 = User.find_by_email("radigin@yandex.ru")
if u2.blank?
  u2 = User.create(email: "radigin@yandex.ru", password: "321", password_confirmation: "321")
=======
u2 = User.find_by_email("radigin@yandex.ru")
if u2.blank?
  u2 = User.create(email: "radigin@yandex.ru", password: "321", password_confirmation: "321")
>>>>>>> ccc135a1ce16c208a84b581a04c6f1afd0263dbf
  u2.activation_state = 'active'
  u2.save
end

r1 = Role.create(name: 'Преподаватель', short_name: 'Преподаватель')

r2 = Role.create(name: 'Администратор', short_name: 'Админ')

r3 = Role.create(name: 'Студент', short_name: 'Студент')

RoleUser.create(role: r1, user: u1)
RoleUser.create(role: r2, user: u1)
RoleUser.create(role: r3, user: u1)

<<<<<<< HEAD
RoleUser.create(role: r1, user: u2)
=======
RoleUser.create(role: r3, user: u2)
>>>>>>> ccc135a1ce16c208a84b581a04c6f1afd0263dbf

uni1 = University.create(name: 'МАМИ', full_name: "Московский государственный машиностроительный университет")
uni2 = University.create(name: 'МГИУ', full_name: "Московский государственный индустриальный университет")

t1 = Teacher.create(last_name: 'Белова', first_name: 'Ирина', second_name: 'Михайловна', b_date: Date.new(1953, 03, 16), degree: 'к.т.н.', rank: 'Доцент', position: 'Заведующая кафедрой')
t2 = Teacher.create(last_name: 'Иванова', first_name: 'Елена', second_name: 'Михайловна', b_date: Date.new(1989, 07, 23), degree: '-', rank: '-', position: 'Старший преподаватель')
t3 = Teacher.create(last_name: 'Радыгин', first_name: 'Виктор', second_name: 'Юрьевич', b_date: Date.new(1980, 05, 03), degree: 'к.т.н.', rank: 'Доцент', position: 'Доцент', user: u2)
t4 = Teacher.create(last_name: 'Петров', first_name: 'Денис', second_name: 'Сергеевич', b_date: Date.new(1972, 07, 29), degree: '-', rank: '-', position: 'Преподаватель')
t5 = Teacher.create(last_name: 'Александрова', first_name: 'Нина', second_name: 'Григорьевна', b_date: Date.new(1989, 10, 9), degree: '-', rank: '-', position: 'Ассистент')
<<<<<<< HEAD
t6 = Teacher.create(last_name: 'Фомина', first_name: 'Наталья', second_name: 'Александровна', b_date: Date.new(1994, 10, 9), degree: '-', rank: '-', position: 'Ассистент', user: u1)

#puts t1.errors.inspect
studs_obj = []
users.each_with_index do |u, i|
  s1 = Student.create(last_name: u[0], first_name: u[1], second_name: u[2], b_date: Date.new(1994, 10, 9), passport_id: (i.to_s*4)[0..3], passport_series: 97687, user: u1)
  studs_obj << s1
end

=======
t6 = Teacher.create(last_name: 'Фомина', first_name: 'Наталья', second_name: 'Александровна', b_date: Date.new(1994, 10, 9), degree: '-', rank: '-', position: 'Ассистент', user: u1)

#puts t1.errors.inspect
>>>>>>> ccc135a1ce16c208a84b581a04c6f1afd0263dbf
s1 = Student.create(last_name: 'Фомина', first_name: 'Наталья', second_name: 'Александровна', b_date: Date.new(1994, 10, 9), passport_id: '0987', passport_series: 97687, user: u1)
s2 = Student.create(last_name: 'Стрельская', first_name: 'Дарья', second_name: 'Александровна', b_date: Date.new(1995, 03, 14), passport_id: '0985', passport_series: 37687)
s3 = Student.create(last_name: 'Седых', first_name: 'Дмитрий', second_name: 'Владимирович', b_date: Date.new(1994, 03, 26), passport_id: '5487', passport_series: 97187)
s4 = Student.create(last_name: 'Фомин', first_name: 'Валерий', second_name: 'Алексеевич', b_date: Date.new(1995, 8, 11), passport_id: '0757', passport_series: 97047)
s5 = Student.create(last_name: 'Умурзакова', first_name: 'Алина', second_name: 'Станиславовна', b_date: Date.new(1994, 12, 16), passport_id: '0547', passport_series: 72687)
if s1.errors.size > 0
  puts s1.errors.inspect
end
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

<<<<<<< HEAD
c1 = Community.create(name: 'Базы Данных')
c2 = Community.create(name: 'Основы Ruby on Rails')

user
=======
c1 = Community.create(name: 'Название1')
c2 = Community.create(name: 'Название2')
>>>>>>> ccc135a1ce16c208a84b581a04c6f1afd0263dbf

p1 = Page.create(visibility: true, header: 'Header1', contents: 'Contents1', alias: 'Alias1')
p2 = Page.create(visibility: true, header: 'Header2', contents: 'Contents2', alias: 'Alias2')
p3 = Page.create(visibility: false, header: 'Header3', contents: 'Contents3', alias: 'Alias3')
p4 = Page.create(visibility: false, header: 'Header4', contents: 'Contents4', alias: 'Alias4')

pc1 = CommunityPage.create(community_id: 1, page_id: 1, ismain: 1)
pc2 = CommunityPage.create(community_id: 1, page_id: 2, ismain: 2)
pc4 = CommunityPage.create(community_id: 1, page_id: 4, ismain: 2)
pc3 = CommunityPage.create(community_id: 1, page_id: 3, ismain: 3)

cu1 = CommunityUser.create(community_id: 1, user_id: 1, typeuser: 0)
