# frozen_string_literal: true

class QuizzesController < ApplicationController
  def index
    @random_quiz = Quiz.where(course_id: params[:id]).sample
    @from_course = Course.find(params[:id])
    @creator = User.find(@from_course.user_id)
  end
end
