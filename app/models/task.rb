class Task < ApplicationRecord
  belongs_to :panel
  belongs_to :user

  enum status: { active: 0, archived: 1, deleted: 2 }
end
