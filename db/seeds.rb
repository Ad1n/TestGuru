# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ruby encoding: utf-8

categories = Category.create([
    { title: 'Backend' },
    { title: 'Machine learning' },
    { title: 'Frontend' }
])

tests = Test.create([
    { title: "Ruby. Ready for action?", level: 5, category_id: 1 },
    { title: "Vue.js - Start you way", level: 2, category_id: 3},
    { title: "Python. Pro", level: 5, category_id: 2},
    { title: "Ruby. Basic", level: 1, category_id: 1}
                    ])

questions = Question.create([
    { body: "What is TDD mean?", test_id: 1},
    { body: "What type of example looks like list_comprehansion?", test_id: 3},
    { body: "What language is base for Vue framework?", test_id: 2},
    { body: "What if symbol @ before variable?", test_id: 4}
                            ])

answers = Answer.create([
    { body: "Test-driving development", question_id: 1 },
    { body: "TV and Radio development", correct: false, question_id: 1 },
    { body: "[expression(i) for i in old_list if filter(i)]", question_id: 2 },
    { body: "[|i| some_method(i)]", correct: false, question_id: 2 },
    { body: "JavaScript", question_id: 3 },
    { body: "Java", correct: false, question_id: 3 },
    { body: "@instance_variable", question_id: 4 },
    { body: "adress for variable", correct: false, question_id: 4 }
                        ])

users = User.create([
    { name: "Anton", login: "Ad1n", password: "Asdf123" },
    { name: "Max", login: "Max", password: "qwertyui"},
    { name: "Oksana", login: "Oks", password: "zxccxz333"}
                    ])

logs = Log.create([
    { passed: true, user_id: 1, test_id: 3 },
    { passed: true, user_id: 1, test_id: 4 },
    { user_id: 1, test_id: 1 },
    { passed: true, user_id: 2, test_id: 4 }
                  ])

