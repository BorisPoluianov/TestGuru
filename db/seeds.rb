# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { email: 'user1@example.com', password: 'password1', first_name: 'John', last_name: 'McKlein' },
  { email: 'user2@example.com', password: 'password2', first_name: 'Hans', last_name: 'Gruber' }
  ])

categories = Category.create([
  { title: 'Worlds capitals' },
  { title: 'Worlds currencies' }
  ])

tests = Test.create([
  { title: 'Capitals of Europe', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Capitals of Asia', level: 2, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Currencies of Europe', level: 2, category_id: categories[1].id, author_id: users[0].id }
  ])

questions = Question.create([
  { body: 'Germany', test_id: tests[0].id },
  { body: 'France', test_id: tests[0].id },
  { body: 'China', test_id: tests[1].id },
  { body: 'Japan', test_id: tests[1].id },
  { body: 'Sweden', test_id: tests[2].id },
  { body: 'Spain', test_id: tests[2].id }
  ])

Answer.create([
  { body: 'Berlin', correct: true, question_id: questions[0].id },
  { body: 'Paris', question_id: questions[0].id },
  { body: 'Madrid', question_id: questions[0].id },
  { body: 'Vienna', question_id: questions[0].id },

  { body: 'London', question_id: questions[1].id },
  { body: 'Oslo', question_id: questions[1].id },
  { body: 'Paris',correct: true, question_id: questions[1].id },
  { body: 'Minsk', question_id: questions[1].id },

  { body: 'Sydney', question_id: questions[2].id },
  { body: 'Beijing', correct: true, question_id: questions[2].id },
  { body: 'Moscow', question_id: questions[2].id },
  { body: 'Shanghai', question_id: questions[2].id },
  { body: 'SPB', question_id: questions[2].id },

  { body: 'Seoul', question_id: questions[3].id },
  { body: 'Yokohama', question_id: questions[3].id },
  { body: 'Tokyo', correct: true, question_id: questions[3].id },
  { body: 'Honolulu', question_id: questions[3].id },

  { body: 'Dollar', question_id: questions[4].id },
  { body: 'Yuan', question_id: questions[4].id },
  { body: 'Ruble', question_id: questions[4].id },
  { body: 'Krona', correct: true, question_id: questions[4].id },

  { body: 'Pound', question_id: questions[5].id },
  { body: 'Yen', question_id: questions[5].id },
  { body: 'Peseta', correct: true, question_id: questions[5].id },
  { body: 'Frank', question_id: questions[5].id }
  ])

TestProgress.create([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[1].id }
  ])
