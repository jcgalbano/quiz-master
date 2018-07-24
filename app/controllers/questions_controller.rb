# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index; end

  # meet all requests to Question with show method
  def show
    # current quiz id
    @curr_quiz_id = params[:id]
    # if nxt_qst is nil, either the question is the first question or last
    nxt_qst_exist = params[:format]

    if nxt_qst_exist.nil?
      @question = Question.find_by(quiz_id: @curr_quiz_id)
    else
      @question = Question.find_by(id: nxt_qst_exist, quiz_id: @curr_quiz_id)
      ans_true = @question.answer
      @question = @question.next(@curr_quiz_id)
      ans_attempt = params[:ans]
      check ans_true, ans_attempt
      if @question.nil?
        @display_score = session[:score]
        session[:score] = nil
        render 'game_over'
      end
    end
  end

  private

  def check(ans, attempt)
    if ans == attempt
      if session[:score].nil?
        # do nothing to avoid a nil type error
      else
        session[:score] += 1
      end
    end
  end
end
