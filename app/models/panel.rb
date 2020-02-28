class Panel < ApplicationRecord
  belongs_to :colour_theme
  belongs_to :user
  has_many :tasks

  enum status: { active: 0, archived: 1, deleted: 2 }
end
