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
    { title: "Ruby. Ready for action?", level: 5, category_id: categories[0].id },
    { title: "Vue.js - Start you way", level: 2, category_id: categories[2].id },
    { title: "Python. Pro", level: 5, category_id: categories[1].id },
    { title: "Ruby. Basic", level: 1, category_id: categories[0].id }
                    ])

questions = Question.create!([
    { body: "What is TDD mean?", test_id: tests[0].id},
    { body: "What type of example looks like list_comprehansion?", test_id: tests[2].id },
    { body: "What language is base for Vue framework?", test_id: tests[1].id },
    { body: "What if symbol @ before variable?", test_id: tests[3].id }
                            ])

answers = Answer.create!([
    { body: "Test-driving development", question_id: questions[0].id },
    { body: "TV and Radio development", correct: false, question_id: questions[0].id },
    { body: "[expression(i) for i in old_list if filter(i)]", question_id: questions[1].id },
    { body: "[|i| some_method(i)]", correct: false, question_id: questions[1].id },
    { body: "JavaScript", question_id: questions[2].id },
    { body: "Java", correct: false, question_id: questions[2].id },
    { body: "@instance_variable", question_id: questions[3].id },
    { body: "adress for variable", correct: false, question_id: questions[3].id }
                        ])

users = User.create!([
    { name: "Anton", login: "Ad1n", password: "Asdf123" },
    { name: "Max", login: "Max", password: "qwertyui"},
    { name: "Oksana", login: "Oks", password: "zxccxz333"}
                    ])

passed_tests = PassedTestLog.create!([
    { passed: true, user_id: users[0].id, test_id: tests[2].id },
    { passed: true, user_id: users[0].id, test_id: tests[3].id },
    { user_id: users[0].id, test_id: tests[0].id },
    { passed: true, user_id: users[1].id, test_id: tests[3].id }
                  ])

