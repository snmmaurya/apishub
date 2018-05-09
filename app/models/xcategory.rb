class Xcategory < ApplicationRecord
  enum status: {on: 0, off: 1}

  # has_many :xcategory_xpositions
  # has_many :xpositions, through: :xcategory_xpositions
  has_many :xpositions

  validates :name, :status, :image, presence: true

  scope :active, -> {where(status: :on)}

  mount_uploader :image, XcatedgoryImageUploader

  def self.get_status_options pair=false
    if pair
      Xcategory.statuses.map{|xc| [xc[0], xc[1]]}
    else
      Xcategory.statuses.map{|xc| xc[0]}
    end
  end

  def self.options
    Xcategory.active.map{|xc| [xc.name, xc.id]}
  end

  def get_image_url
    if self.image.present?
      self.image.url
    end
  end
end