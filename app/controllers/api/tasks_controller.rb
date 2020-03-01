class Api::TasksController < ApplicationController
  before_action :set_tasks, only: [:index]
  before_action :permitted_params, only: [:create, :update]

  def index
    render json: TaskSerializer.new(@tasks, options).serialized_json
  end

  def create
    create_params = @task_params.merge(
      user: current_user,
      panel: Panel.find(@task_params[:panel_id])
    )

    service = Tasks::CreateService.new(create_params)

    if service.call
      render json: TaskSerializer.new(set_tasks)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    update_params = @task_params.merge(task: task)

    service = Tasks::UpdateService.new(update_params)

    if service.call
      render json: TaskSerializer.new(set_tasks, options)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def destroy
    service = Tasks::DestroyService.new(task: task)

    if service.call
      render_json_success
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def set_tasks
    @tasks = Task.eager_load(:panel).where(user: current_user)
  end

  def permitted_params
    @task_params = params.require(:task).permit(
      :text,
      :completed,
      :panel_id
    )
  end

  def options
    options = {
      include: [:panel]
    }
  end
end
