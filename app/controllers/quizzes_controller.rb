# frozen_string_literal: true

class QuizzesController < ApplicationController
  def index
    session[:score] = 0
    puts params
    @random_quiz = Quiz.where(course_id: params[:id])
    if @random_quiz.empty?
      render 'empty'
    else
      @random_quiz = @random_quiz.sample
      @from_course = Course.find(params[:id])
      @creator = User.find(@random_quiz.user_id)
    end
  end
end
