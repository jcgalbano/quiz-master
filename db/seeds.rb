# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = User.create!(user_name: 'info.admin', email: 'admin@sample.com', password: '123qweiop', password_confirmation: '123qweiop', role: 'admin')
user1 = User.create!(user_name: 'Shiva', email: 'user1@sample.com', password: 'iopqwe123', password_confirmation: 'iopqwe123', role: 'user')
user2 = User.create!(user_name: 'Breaking_Bad', email: 'user2@sample.com', password: 'qweiop123', password_confirmation: 'qweiop123', role: 'user')

Course.create!(title: 'Astronomy', user_id: user1.id)
Course.create!(title: 'Geography', user_id: user1.id)
Course.create!(title: 'Computer Science', user_id: user1.id)
Course.create!(title: 'Wrestling', user_id: user1.id)
Course.create!(title: 'Commercials', user_id: user1.id)
Course.create!(title: 'Logical Thinking', user_id: user1.id)
easy1 = Course.create!(title: 'Numbers', user_id: user1.id)
easy2 = Course.create!(title: 'Names', user_id: user1.id)
Course.create!(title: 'Astrology', user_id: user2.id)
Course.create!(title: 'Fallacies', user_id: user2.id)
Course.create!(title: 'Motorbikes', user_id: user2.id)
Course.create!(title: 'React/Redux', user_id: user2.id)
Course.create!(title: 'Planes', user_id: user2.id)
Course.create!(title: 'Cooking 101', user_id: user2.id)
Course.create!(title: 'Film', user_id: user2.id)
Course.create!(title: 'Japan Railways', user_id: user2.id)

Quiz.create!(title: 'Long Exam 3', course_id: easy1.id, user_id: user1.id)
Quiz.create!(title: 'Mind Games', course_id: easy1.id, user_id: user1.id)
Quiz.create!(title: 'Physics', course_id: easy1.id, user_id: user1.id)
Quiz.create!(title: 'Hard Exam', course_id: easy1.id, user_id: user2.id)
exam1 = Quiz.create!(title: 'Philippine Presidents', course_id: easy2.id, user_id: user1.id)
exam2 = Quiz.create!(title: 'Vehicles 101', course_id: easy1.id, user_id: user2.id)
exam3 = Quiz.create!(title: 'Onomatopoeia!', course_id: easy2.id, user_id: user1.id)
exam4 = Quiz.create!(title: 'Legs', course_id: easy1.id, user_id: user2.id)

Question.create!(content: 'What is the first name of our current president?', answer: 'rodrigo', quiz_id: exam1.id, user_id: user1.id)
Question.create!(content: 'What is the first name of President Arroyo?', answer: 'gloria', quiz_id: exam1.id, user_id: user1.id)
Question.create!(content: 'What is the first name of Noynoy', answer: 'benigno', quiz_id: exam1.id, user_id: user1.id)
Question.create!(content: 'What is the first name of Ninoy', answer: 'benigno', quiz_id: exam1.id, user_id: user1.id)

Question.create!(content: 'How many wheels are there in a car?', answer: '4', quiz_id: exam2.id, user_id: user2.id)
Question.create!(content: 'How many wheels are there in a bike?', answer: '2', quiz_id: exam2.id, user_id: user2.id)
Question.create!(content: 'How many wheels are there in a motorcycle?', answer: '2', quiz_id: exam2.id, user_id: user2.id)
Question.create!(content: 'How many wheels are there in a unicycle?', answer: '1', quiz_id: exam2.id, user_id: user2.id)

Question.create!(content: 'What animal does this? -> *hiss*', answer: 'snake', quiz_id: exam3.id, user_id: user1.id)
Question.create!(content: 'What animal does this? -> *woof*', answer: 'dog', quiz_id: exam3.id, user_id: user1.id)
Question.create!(content: 'What animal does this? -> *cat*', answer: 'meow', quiz_id: exam3.id, user_id: user1.id)
Question.create!(content: 'What animal does this? -> *tweet tweet*', answer: 'bird', quiz_id: exam3.id, user_id: user1.id)

Question.create!(content: 'How many legs does a spider have?', answer: '8', quiz_id: exam4.id, user_id: user2.id)
Question.create!(content: 'How many legs does a human have?', answer: '2', quiz_id: exam4.id, user_id: user2.id)
Question.create!(content: 'How many legs does a crab have?', answer: '10', quiz_id: exam4.id, user_id: user2.id)
Question.create!(content: 'How many legs does a lion have?', answer: '4', quiz_id: exam4.id, user_id: user2.id)
