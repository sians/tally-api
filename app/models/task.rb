class Task < ApplicationRecord
  belongs_to :panel
  belongs_to :user
end
