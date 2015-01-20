class Todo

  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_method(:==) do |another_todo|
    self.description().==(another_todo.description())
  end

  define_singleton_method(:all) do
    returned_descriptions = DB.exec("SELECT * FROM todos;")
    todos = []
    returned_descriptions.each() do |todo|
      description = todo.fetch("description")
      todos.push(Todo.new({:description => description}))
    end
    todos
  end

  define_method(:save) do
    DB.exec("INSERT INTO todos (description) VALUES ('#{@description}');")
  end

  define_singleton_method(:clear) do
    @@todo_list = []
  end
end
