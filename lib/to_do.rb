class Todo

  @@todo_list = []

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
    @@todo_list
  end

  define_method(:save) do
    @@todo_list.push(self)
  end

  define_singleton_method(:clear) do
    @@todo_list = []
  end
end
