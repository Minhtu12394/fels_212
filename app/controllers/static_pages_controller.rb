class StaticPagesController < ApplicationController
  def home
    @lessons = Lesson.order_date_desc.start_by(current_user).includes(:answers, :results)
  end

end
