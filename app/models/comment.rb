class Comment < ApplicationRecord
  belongs_to :deal
  validates :name, presence: true
  validates :body, presence: true
end
