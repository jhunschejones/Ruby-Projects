# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_subject = Subject.create(name: "Test Subject")
test_page = Page.create(name: "Page One", permalink: "100", subject_id: test_subject.id)
Section.create(name: "Section One", page_id: test_page.id, content_type: "text", content: "Here is some great test content for my section!")
AdminUser.create(first_name: "Carl", last_name: "Fox", username: "dafoxisdis", email: "carl@dafox.com", password:"super_secure")
