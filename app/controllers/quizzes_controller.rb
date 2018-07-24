# frozen_string_literal: true

class QuizzesController < ApplicationController
  def index
    session[:score] = 0
    @random_quiz = Quiz.where(course_id: params[:id]).sample
    @from_course = Course.find(params[:id])
    @creator = User.find(@random_quiz.user_id)
  end
end
