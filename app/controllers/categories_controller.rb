class CategoriesController < ApplicationController
    before_action :set_id, only: [:show, :update, :update, :destroy]
    def index
        @categories = current_user.categories
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to @category
        else
            render :new, status: unprocessable_entity
        end
    end

    def edit
    end

    def update

        if @category.update(category_params)
            redirect_to @category, notice: "Category updated!"
        else
            render :edit, status: unprocessable_entity
        end
    end

    def destroy
        @category.destroy

        redirect_to categories_path
    end

    private
    def category_params
        params.require(:category).permit(:name, :details)
    end

    def set_id
        @category = current_user.categories.find(params[:id])
    end
end
