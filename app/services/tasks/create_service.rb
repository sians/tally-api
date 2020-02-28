class Tasks::CreateService < BaseService
  attr_accessor :panel_id
  attr_accessor :panel
  attr_accessor :text
  attr_accessor :completed
  attr_accessor :user

  attr_accessor :task

  validates :panel, :user, presence: true

  def call_after_validation
    create_task

    valid?
  end

  def create_task
    @task = Task.create(
      text: @text,
      panel: @panel,
      completed: false,
      user: @user
    )
  end

  def valid?
    return false unless super

    return true if @errors.empty?

    false
  end
end
