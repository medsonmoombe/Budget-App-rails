class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_and_belongs_to_many :transactions, class_name: 'Transaction', dependent: :destroy

  # validates :name, presence: true, length: { maximum: 255 }
  # has_one_attached :icon

  def total_amount
    transactions.sum(:amount)
  end
end
