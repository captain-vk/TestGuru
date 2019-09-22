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

tests = Test.create!([{title: 'Ruby', level: 1, category_id: categories[1]},
					  {title: 'JavaScript', level: 5, category_id: categories[0]},
					  {title: 'Java', level: 1, category_id: categories[2]}])

users = User.create([{login: 'Ivan', password: 'qwerty'}])

questions = Question.create!([{body: 'Кто создал язык Ruby?', test_id: tests[0]},
						  {body: 'Что такое замыкания?', test_id: tests[1]},
						  {body: 'Переведи на англ. Сборщик мусора', test_id: tests[2]}])

answers = Answer.create!([{body: 'Юкихиро Мацумото', correct: true, question_id: questions[0]},
						  {body: 'Когда проводка замыкает', correct: false, question_id: questions[1]},
						  {body: 'Garbage collector', correct: true, question_id: questions[2]}])
