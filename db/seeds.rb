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

users = User.create!([{login: 'Ivan', password: 'qwerty'},
   					  {login: 'Petr', password: 'asdfgh'}])	

tests = Test.create!([{title: 'Ruby', level: 1, category: categories[1], author: users[0] },
 					  {title: 'JavaScript', level: 5, category: categories[0], author: users[0] },
  					  {title: 'Java', level: 1, category: categories[2], author: users[1] }])

questions = Question.create!([{body: 'Кто создал язык Ruby?', test: tests[0] },
						      {body: 'Что такое замыкания?', test: tests[1] },
						      {body: 'Что такое ЯП?', test: tests[1] },
						      {body: 'Переведи на англ. Сборщик мусора', test: tests[2] }])

answers = Answer.create!([{body: 'Юкихиро Мацумото', correct: true, question: questions[0] },
						  {body: 'Когда проводка замыкает', correct: false, question: questions[1] },
						  {body: 'Garbage collector', correct: true, question: questions[2] }])

results = Result.create!([{user: users[0], test: tests[0] },
                 		  {user: users[1], test: tests[2] },
                		  {user: users[0], test: tests[1] }])