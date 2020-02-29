class ColourTheme < ApplicationRecord
  has_many :panels
  belongs_to :user
end
