class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        if params[:category_id]
            @category = Category.find(params[:category_id])
            @task = @category.tasks.build
        else
            @task = Task.new
        end
    end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to category_path(@task.category), notice: "Task was successfully created."
        else
            @category = @task.category || Category.find(params[:category_id]) if params[:category_id]
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @task = Task.find(params[:id])
        @category = @task.category
    end

    def update
        @task = Task.find(params[:id])
        @category = @task.category

        if @task.update(task_params)
            redirect_to category_task_path(@task), notice: "Task updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task = Task.find(params[:id])
        category_id = @task.category_id
        @task.destroy

        redirect_to category_path(category_id), notice: "Task was successfully deleted."
    end

    private
    def task_params
        params.require(:task).permit(:name, :details, :status, :due_date, :category_id)
    end
end
