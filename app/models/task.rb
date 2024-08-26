class Task < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  has_many :comments
  validates :name, presence: true
end
