# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    # gets all the courses to be displayed on root
    @courses = Course.all
  end
end
