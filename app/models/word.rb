class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validates :content, presence: true
  scope :order_date_desc, ->{order created_at: :desc}

  validate :must_be_a_answer_correct, on: [:create, :update]

  private
  def must_be_a_answer_correct
    unless self.answers.select{|answer| answer.correct}.size == 1
      errors.add " ", I18n.t(:must_have_correct_answer)
    end
  end
end
