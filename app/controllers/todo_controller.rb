class TodoController < ActionController::Base
    skip_before_action :verify_authenticity_token

    # get all todos
    def getAllTodo
        render :json => Todo.all
    end

    # create new todo
    def createTodo
        todoItem = {
            "title" => params[:title],
            "completed" => params[:completed]
        }
        todo = Todo.new(todoItem)
        todo.save
        render :json => Todo.all
    end

    # delete a todo
    def deleteTodo
        res = Todo.find(params[:id].to_i)
        res.destroy
        render:json => Todo.all
    end

    # update a todo
    def updateTodo
        res = Todo.find(params[:id].to_i)
        res.update(
            "title" => params[:title],
            "completed" => params[:completed]
        )
        render :json => Todo.all
    end

end