class Transaction < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_and_belongs_to_many :categories

  validates :name, :amount, presence: true
end
