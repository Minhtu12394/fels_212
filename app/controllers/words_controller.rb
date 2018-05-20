class WordsController < ApplicationController
  def index
    @q = Word.joins(:category).search params[:q]
    @words = @q.result.order_date_desc.includes(:category, :answers).
      page(params[:page]).per Settings.word_per_page
  end
end
