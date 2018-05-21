class Word < ApplicationRecord
  belongs_to :category
  has_many :answers
  accepts_nested_attributes_for :answers
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  scope :order_date_desc, ->{order created_at: :desc}
end
