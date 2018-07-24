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
    # made implementaion a little bit relaxed
    # 'Five' == 'five'=> true
    # cause it's more natural for the platform
    # to accept what it can distinguish to be true
    # as per my interpretation of 1 answer on the specs
    # considering the same semantics
    case1 = number? ans1
    case2 = number? ans2
    if case1 && !case2
      Integer(ans1).humanize.casecmp(ans2).zero?
    elsif !case1 && case2
      Integer(ans2).humanize.casecmp(ans1).zero?
    elsif case1 && case2
      Integer(ans1) == Integer(ans2)
    else
      # gives the student some space in format
      # gives point if Five against FiVe
      # gives point if hArrt against HARRY
      # as it answers the semantics of the question
      ans1.casecmp(ans2).zero?
    end
  end
end
