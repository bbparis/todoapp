class TodosController < ApplicationController
   
   #I'm going to autorize here set_todo for all the methods that need it
   # and add it in the private section
   before_action :set_todo, only: [:edit, :update, :show, :destroy]
  # from here, I'm adding the top methods that I'm goint to use 
   def new
       @todo =Todo.new
   end
   
   def create
      @todo =Todo.new(todo_params)
      if @todo.save
      flash[:notice] = "Todo was created successfully"
      redirect_to todo_path(@todo)
      else
      render 'new'
      end
   end    
   
   def show
   end
   
   def edit
   end
   
   def update
      if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
      else
      render 'edit'
      end
   end
   
   def index
      @todos = Todo.all
   end
   
   def destroy
      @todo.destroy
      flash[:notice]="Your Todo deleted successfuly"
      redirect_to todos_path
   end
   
   #Here is the private part of todo
   private
   
   def set_todo
      @todo = Todo.find(params[:id])
   end
   
   def todo_params
      params.require(:todo).permit(:name, :description)
   end
   
end