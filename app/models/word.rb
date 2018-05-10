class Word < ApplicationRecord
  belongs_to :category
  has_many :answer
  has_many :results, dependent: :destroy

  validates :meaning, presence: true
end
