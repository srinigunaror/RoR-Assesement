class Api::TasksController < ApplicationController
  before_action :set_tasks, except: [:create]
  before_action :set_task, except: [:index, :create, :overdue, :status, :completed, :statistics]

  def index
    if params[:user_id].present?
      @tasks = @tasks.where(assigned_to_id: params[:user_id])
    end

    @tasks = @tasks.paginate(page: params[:page], per_page: params[:per_page])
  end

  def create
    @task = Task.new(task_new_params)
    if @task.save
      render :show
    else
      render_error(@task,:ok)
    end
  end

  def show

  end

  def update
    if @task.update(task_update_params)
      render :show
    else
      render_error(@task,:ok)
    end
  end

  def destroy
    if @task.destroy
      render json: {message: "Task deleted successfully"}
    else
      render_error(@task,:ok)
    end
  end

  def assign
    if @task.update(task_assign_params)
      render :show
    else
      render_error(@task,:ok)
    end
  end

  def progress
    if @task.update(task_progress_params)
      render :show
    else
      render_error(@task,:ok)
    end
  end

  def overdue
    @tasks = @tasks.where("due_date < ?", Date.today).paginate(page: params[:page], per_page: params[:per_page])
    render :index
  end

  def status
    @tasks = @tasks.where(status: params[:status]).paginate(page: params[:page], per_page: params[:per_page])
    render :index
  end

  def completed
    @tasks = @tasks.completed_between(params[:start_date], params[:end_date]).paginate(page: params[:page], per_page: params[:per_page])
    render :index
  end

  def statistics
    total_count = @tasks.count
    completed_count = @tasks.where(status: "completed").count
    percentage_completed = total_count / completed_count.to_f
    render json: {total_count: total_count, completed_count: completed_count, percentage_completed: percentage_completed}
  end

  private

  def set_tasks
    @tasks = Task.order("due_date desc, priority asc")
  end

  def set_task
    @task = @tasks.find_by(id: params[:id])
    if @task.nil?
      raise ActiveRecord::RecordNotFound
    end
  end

  def task_new_params
    params.require(:task).permit(:title, :description, :due_date, :priority)
  end

  def task_update_params
    params.require(:task).permit(:title, :description, :due_date, :status, :priority)
  end

  def task_assign_params
    params.require(:task).permit(:assigned_to_id)
  end  

  def task_progress_params
    params.require(:task).permit(:progess_percentage)
  end    
end
