class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy
  has_many :words, through: :results
  has_many :answers, through: :results
  accepts_nested_attributes_for :results
  before_create :create_word
  validate :words_quantity, on: :create

  scope :start_by, ->user_id{where user_id: user_id}

  private

  def create_word
    self.words = category.words.limit(Settings.word_limit).order("RAND()")
  end

  def words_quantity
    if category.words.count <= Settings.word_limit
      errors.add :error, I18n.t(:not_enough_word)
    end
  end

end
