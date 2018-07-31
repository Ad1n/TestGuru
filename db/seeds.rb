# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ruby encoding: utf-8

categories = Category.create!([
    { title: 'Backend' },
    { title: 'Machine learning' },
    { title: 'Frontend' }
])

tests = Test.create!([
    { title: "Ruby. Ready for action?", level: 5, category: categories[0] },
    { title: "Vue.js - Start you way", level: 2, category: categories[2] },
    { title: "Python. Pro", level: 5, category: categories[1] },
    { title: "Ruby. Basic", level: 1, category: categories[0] }
                    ])

questions = Question.create!([
    { body: "What is TDD mean?", test: tests[0] },
    { body: "What type of example looks like list_comprehansion?", test: tests[2] },
    { body: "What language is base for Vue framework?", test: tests[1] },
    { body: "What if symbol @ before variable?", test: tests[3] }
                            ])

answers = Answer.create!([
    { body: "Test-driving development", question: questions[0] },
    { body: "TV and Radio development", correct: false, question: questions[0] },
    { body: "[expression(i) for i in old_list if filter(i)]", question: questions[1] },
    { body: "[|i| some_method(i)]", correct: false, question: questions[1] },
    { body: "JavaScript", question: questions[2] },
    { body: "Java", correct: false, question: questions[2] },
    { body: "@instance_variable", question: questions[3] },
    { body: "adress for variable", correct: false, question: questions[3] }
                        ])

users = User.create!([
    { name: "Anton", login: "Ad1n", password: "Asdf123" },
    { name: "Max", login: "Max", password: "qwertyui"},
    { name: "Oksana", login: "Oks", password: "zxccxz333"}
                    ])

passed_tests = PassedTestLog.create!([
    { passed: true, user: users[0], test: tests[2] },
    { passed: true, user: users[0], test: tests[3] },
    { user: users[0], test: tests[0] },
    { passed: true, user: users[1], test: tests[3] }
                  ])

