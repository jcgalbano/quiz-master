# frozen_string_literal: true

class QuestionsController < ApplicationController
  # meet the first call to Question with the index controller and find the first question
  def index; end

  # meet the next call to Question using show
  def show
    if params[:format].nil?
      @question = Question.where(quiz_id: params[:id]).first
    else
      @question = Question.find(params[:format])
      @question = @question.next
      # check params[:ans]
    end
  end

  private

  def check(ans); end
end
