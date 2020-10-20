class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deals, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validate :image_type

  private

  def image_type
    errors.add(:image, 'is missing') if image.attached? == false
    if image.attached? == true
      unless image.content_type.in?(%('images/jpg image/jpeg image/png'))
        errors.add(:image, 'needs to be a jpeg or png')
      end
    end
  end
end
