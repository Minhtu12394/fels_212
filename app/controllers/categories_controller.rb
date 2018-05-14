class CategoriesController < ApplicationController
  before_action :load_category, only: %i(show)

  def index
    @categories = Category.order_date_desc.page(params[:page]).per Settings.cate_per_page
  end

  def show
    @lessons = @category.lessons.includes(:answers, :results).
      start_by(current_user).order(created_at: :desc)
  end

  private
  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
      flash[:warning] = t :not_found
      redirect_to categories_path
  end
end
