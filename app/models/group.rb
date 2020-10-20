class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :icon, dependent: :destroy
  has_many :dealings, dependent: :destroy
  has_many :deals, through: :dealings
  validates :name, presence: true
  validate :icon_type

  private

  def icon_type
    errors.add(:icon, 'is missing') if icon.attached? == false
    if icon.attached? == true
      unless icon.content_type.in?(%('image/jpg image/jpeg image/png image/ico'))
        errors.add(:icon, 'needs to be ajpeg or png or ico')
      end
    end
  end
end
