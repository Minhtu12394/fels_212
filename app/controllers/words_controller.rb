class WordsController < ApplicationController
  def index
    @words = Word.order_date_desc.includes(:category, :answers).page(params[:page]).per Settings.word_per_page
  end
end
