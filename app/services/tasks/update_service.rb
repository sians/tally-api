class Tasks::UpdateService < BaseService
  attr_accessor :id
  attr_accessor :text
  attr_accessor :completed
  attr_accessor :panel_id

  attr_accessor :task

  validates :task, presence: true

  def call_after_validation
    update_task

    valid?
  end

  def update_task
    updated_details = {
      text: @text,
      completed: @completed,
      panel_id: @panel_id
    }
    @task.update!(updated_details)
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
