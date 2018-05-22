class StaticPagesController < ApplicationController
  def home
    @lessons = Lesson.order_date_desc.start_by(current_user).includes(:answers, :results)
    @activities = Activity.order_date_desc.belongs(current_user)
  end

end
