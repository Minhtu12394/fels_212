class Word < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :results, dependent: :destroy

  validates :meaning, presence: true
end
