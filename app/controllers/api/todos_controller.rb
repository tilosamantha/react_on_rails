class Api::TodosController < ApplicationController
  #html
  #xml
  #json

  # new, edit, show
  # these are just forms, we dont need them on this level
  # show displays an individual object, dont need it here

  def index
    render json: Todo.all
  end

  def show
    render json: Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: {errors: @todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: {errors: @todo.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    render json: {message: 'todo deleted'}
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :complete)
    end
end
