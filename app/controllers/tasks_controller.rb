class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = current_user.tasks
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(params[:task])
    @task.save
    respond_with(@task)
  end

  def update
    @task.update_attributes(params[:task])
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end
end
