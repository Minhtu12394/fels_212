class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_lesson, only: %i(update destroy)
  before_action :load_category, only: %i(create)

  def show
    @lesson = Lesson.includes(:category, words: :answers).find_by id: params[:id]
  end

  def create
    @lesson = @category.lessons.build user_id: current_user.id
    if @lesson.save
      flash[:success] = t :create_lesson_success
      redirect_to @lesson
    else
      flash[:danger] = @lesson.errors.full_messages.join(", ")
      redirect_to categories_path
    end
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t :update_success
    else
      flash[:danger] = t :update_fail
      redirect_to @category
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit results_attributes: [:id, :answer_id]
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
    return if @lesson
    flash[:warning] = t :not_found
    redirect_to lessons_path
  end

  def load_category
    @category = Category.find params[:category_id]
    return if @category
    flash[:danger] = t :not_found
    redirect_to category_path
  end

end
