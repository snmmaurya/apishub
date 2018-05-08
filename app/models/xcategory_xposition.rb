class XcategoryXposition < ApplicationRecord
  enum status: {active: 0, inactive: 1}

  belongs_to :xcategory
  belongs_to :xposition
end