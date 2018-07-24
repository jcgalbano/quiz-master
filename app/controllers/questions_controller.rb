# frozen_string_literal: true

class QuestionsController < ApplicationController
  # meet all requests to Question with show method
  # to keep code concise
  def show
    # instance variable to track if the prev question
    # has been answered incorrectly
    @incorrect = false
    # current quiz id
    @curr_quiz_id = params[:id]
    # if nxt_qst is nil, either the question is the first question or last
    nxt_qst_exist = params[:format]

    if nxt_qst_exist.nil?
      # if we are on the first question
      # find first question
      @question = Question.find_by(quiz_id: @curr_quiz_id)
    else
      # else find the question where question.id = quiz_id
      @question = Question.find_by(id: nxt_qst_exist, quiz_id: @curr_quiz_id)
      # store the answer for comparation
      ans_true = @question.answer
      # get the next question which has the
      # the immediate greater id to our current one
      @question = @question.next(@curr_quiz_id)

      # store the users answer
      ans_attempt = params[:ans]
      # check the equivalence of the true answer to the user's attempt
      check ans_true, ans_attempt

      # make the prev answer to be available on the
      # view for us to be able to display it still on
      # the next question
      @prev_ans = ans_true

      # if the question becomes nil that means it's the last question
      # this is a deconstructed linked list approach
      # that if a node->next == null
      # the node is the last link
      if @question.nil?
        # make score displayable on our Game Over screen
        @display_score = session[:score]
        # reinitialize the score so once the user leaves
        # the Game Over screen the game is officially done
        session[:score] = nil
        # show the Game Over screen
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
        # if the score is already initialized
        # and the answer is correct
        # increment the score
        session[:score] += 1
      end
    else
      # if the attempt was wrong
      # make incorrect to be true
      # for the recall to show to know if
      # the previous answer was incorrect
      @incorrect = true
    end
  end
end
