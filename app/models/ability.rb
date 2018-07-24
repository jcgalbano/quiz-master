# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # anyone who's signed in can access rails_admin
    # and the dashboard
    can :access, :rails_admin
    can :dashboard, :all
    if user.admin?
      # only a website admin can manage everything
      can :manage, :all
    else
      # a normal user can only manage his courses
      can :manage, Course, user_id: user.id
      # but is able to refer to all courses
      # for making quizzes under course topics of other people
      can :read, Course
      # can manage only his quizzes and questions
      can :manage, Quiz, user_id: user.id
      can :manage, Question, user_id: user.id
    end
  end
end
