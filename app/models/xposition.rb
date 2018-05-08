class Xposition < ApplicationRecord
   enum status: {on: 0, off: 1}

  # has_many :xcategory_xpositions
  # has_many :xcategories, through: :xcategory_xpositions

  belongs_to :xcategory

  validates :title, :description, :xcategory, :status, :image, presence: true

  scope :active, -> {where(status: :on)}

  mount_uploader :image, XpositionImageUploader

  def self.get_status_options pair=false
    if pair
      Xposition.statuses.map{|op| [op[0], op[1]]}
    else
      Xposition.statuses.map{|op| op[0]}
    end
  end

  def get_image_url
    if self.image.present?
      self.image.url
    end
  end
end