class Todo

  attr_reader(:id, :description)
  @@todo_list = []

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |name|
    same_class = self.class().eql?(other.class())
    same_name - self.name().eql?(other.name())
    same_class.&(same_name)
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
