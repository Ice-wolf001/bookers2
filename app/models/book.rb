class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {maximum: 20}
  validates :body, presence: true, length: {maximum: 200}
  # has_one_attached :image
end
