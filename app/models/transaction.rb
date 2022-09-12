class Transaction < ApplicationRecord
  belongs_to :user, class_name: 'User'

  validates :name, :amount, presence: true
end
