class TaskSerializer < BaseSerializer
  set_type :task
  attributes :id, :text, :completed

  belongs_to :panel
end
