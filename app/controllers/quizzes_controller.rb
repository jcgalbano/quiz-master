# frozen_string_literal: true

class QuizzesController < ApplicationController
  def index
    # initialize score to 0 when user receives a quiz
    session[:score] = 0
    # gets all the quizzes under the selected course topic
    @random_quiz = Quiz.where(course_id: params[:id])
    # if the quizzes under that topic is empty
    if @random_quiz.empty?
      # show the results empty page
      render 'shared/empty'
    else
      # if there are existing quizzes under the selected topic
      # get a random quiz
      @random_quiz = @random_quiz.sample
      # gets the random quiz's associations for possible use
      @from_course = Course.find(params[:id])
      @creator = User.find(@random_quiz.user_id)
    end
  end
end
