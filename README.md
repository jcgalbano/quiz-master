# Quiz Master!
A simple web app that implements a question-answer platform with basic CRUD functions for the Question objects + added functionalities.

## Introduction
  In the creation of this exercise I intended to create a platform/app wherein I wanted it to be an 'open-source' way of learning. Its goal is to be able to improve stock knowledge through a wide array of topics provided by the community. A digestible bite of knowledge if you will. Afterall an approximate amount may not lead us to the truth, but may very well make us closer to it.

<img src="https://i.pinimg.com/originals/5a/01/29/5a0129d23531e5562d3a3f07daa074b6.jpg" height="700">

This idea can be integrated to an education platform to help students get a boost in their general knowledge, some things that can't be learned from school.

## Setup
1. Make sure to have basic requirements like Ruby and Rails (and Bundler). See "Specs" section for exact versions
2. `Bundle Install` on project root to install all necessary gems.
3. Edit db config for development environment (or wherever you are testing this on) for pg by editing `config/database.yml`
4. Project is assisted by Figaro in doing ENV variables. Follow Figaro's documentation in setting them.
5. ^ or  `bundle exec figaro install`. This creates a commented config/application.yml file and adds it to your .gitignore. Add your own configuration to this file and you're done.
6. Thus you can set db env variables with the help of figaro's application.yml
7. Set also devise's secret key in `config/initializers/devise.rb`
8. run `rails db:migrate`
9. run `rails db:seed` to use preloaded records
10. Start puma using `rails s` and visit 'localhost:3000'

## Implementation Details
* Provided are 3 users, one is an admin account.
* To be able to try the platform pick `Numbers` or `Names` in the root page.
* This will cover the basic specs of the technical exam such as checking for equality between words and numbers and string comparison.
* In lieu of a strict input-answer comparison, user experience made it more practical and logical to accept the equality "Answer" and "answeR"
* This is to cater to a a younger audience and reduce frustrations in the revelation of the answer being one letter-off from the actual answer
* Functionality of number checker is limited to Integers as floats in answers made it problematic for extraction and word conversion.
* Even number extraction is relaxed as checking edge cases is a tedious task like being careful not to extract '21' from an answer of '21guns' and be considered correct.
* Provided are tests using RSpec and feature tests using Capybara.

## Recommendations/Improvements
* Timer system per question - cause short and simple answers tend to improve muscle memory.
* Leaderboard - instead of sessions implement attempts on key-value storage.
* Turbolinks - under the time contraints I wasn't able to implement this. A better solution to having haml switching on the course of a quiz is an Ajax implementation.
* More efficient approach - I understand that really integrating JS, React, and Ajax calls will make this more efficient in implementation and DB calls. Such as calling a single method making a check comparisons of attempts to answers of an instance collection @questions as compared to daisy chaining events using routes (which is what I have come to do in the time frame).
* Improve UI/UX - I wanted the theme to be a dungeon crawler/indie game theme. This, I believe will keep the focus and attention of users from a wider audience in terms of age. Also, game aesthetics never get old.

## Specs

* Ruby version => 2.4.1
* Rails version => '~> 5.1.6'
