class TodosController < ApplicationController
   
   #here you have to define 'new' action and create an html file to it
   def new
       @todo =Todo.new
   end
   #here you have to create a todo
   def create
      @todo = Todo.create(todo_params)
      if @todo.save
      flash[:notice] = "Todo was created successfully"
      redirect_to todo_path(@todo)
      else
      render 'new'
      end
   end    
   
   def show
      @todo = Todo.find(params[:id])
   end
   
   private
   
   def todo_params
      params.require(:todo).permit(:name, :description)
   end
   
end

XXXXXXXXXXXXXxxxxxxxxxxxxxxxxxxxxxxxxxxxxx