class Panel < ApplicationRecord
  belongs_to :colour_theme
  belongs_to :user
end
