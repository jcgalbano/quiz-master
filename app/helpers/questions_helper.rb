# frozen_string_literal: true

module QuestionsHelper
  def number?(string)
    # used Integer as having floats as an edge case
    # makes it complicated as gem:humanize translates
    # per digit thus original answer of 5.0 may
    # translate to five point zero instead
    # of simply being five

    true if Integer(string)
  rescue StandardError
    false
  end

  def case_checker(ans1, ans2)
    # this function was strictly implemented
    # by having only only 1 answer to the question
    # as per project specs
    # meaning five != Five != FiVe
    # if the answer is 5 it translates to 'five'
    # which is the ONLY answer to the question
    case1 = number? ans1
    case2 = number? ans2
    if case1 && !case2
      Integer(ans1).humanize == ans2
    elsif !case1 && case2
      Integer(ans2).humanize == ans1
    elsif case1 && case2
      Integer(ans1) == Integer(ans2)
    else
      # gives the student some space in format
      # gives point if Five against FiVe
      # gives point if hArrt against HARRY
      # as it answers the semantics of the question
      ans1 == ans2
    end
  end
end
