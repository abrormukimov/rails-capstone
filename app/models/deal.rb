class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :dealings, dependent: :destroy
  has_many :groups, through: :dealings
  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true
  has_many :comments, dependent: :destroy

  default_scope { order('created_at DESC') }
end
