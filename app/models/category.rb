class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

  validates :name, presence: true, length: Settings.category_name
  scope :order_date_desc, ->{order created_at: :desc}
end
