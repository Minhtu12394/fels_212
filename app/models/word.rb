class Word < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validates :content, presence: true, length: {maximum: Settings.word_content}
  validates :meaning, length: {maximum: Settings.word_meaning}

  scope :order_date_desc, ->{order created_at: :desc}
end
