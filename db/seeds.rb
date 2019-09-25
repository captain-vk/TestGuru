# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{title: 'Frontend'},
							   {title: 'Backend'},
							   {title: 'Mobile'}])

tests = Test.create!([{title: 'Ruby', level: 1, category_id: categories[1].id },
					  {title: 'JavaScript', level: 5, category_id: categories[0].id },
					  {title: 'Java', level: 1, category_id: categories[2].id }])

users = User.create!([{login: 'Ivan', password: 'qwerty'},
					 {login: 'Petr', password: 'asdfgh'}])								

questions = Question.create!([{body: 'Кто создал язык Ruby?', test_id: tests[0].id },
						  {body: 'Что такое замыкания?', test_id: tests[1].id },
						  {body: 'Переведи на англ. Сборщик мусора', test_id: tests[2].id }])

answers = Answer.create!([{body: 'Юкихиро Мацумото', correct: true, question_id: questions[0].id },
						  {body: 'Когда проводка замыкает', correct: false, question_id: questions[1].id },
						  {body: 'Garbage collector', correct: true, question_id: questions[2].id }])

results = Result.create!([{user_id: users[0].id, test_id: tests[0].id },
                		  {user_id: users[1].id, test_id: tests[2].id },
               			  {user_id: users[0].id, test_id: tests[1].id }])