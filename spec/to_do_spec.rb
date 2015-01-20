require('rspec')
require('to_do')

describe(Todo) do

  before() do
    Todo.clear()
  end

  describe("#description") do
    it("lets you give it a description") do
      test_todo = Todo.new({:id => 1, :description => "scrub the zebra"})
      expect(test_todo.description).to(eq("scrub the zebra"))
    end
  end

  describe('#id') do
    it('lets you give it an id') do
      test_todo = Todo.new({:id => 1, :description => "scrub the zebra"})
      expect(test_todo.id).to(eq(1))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Todo.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves description') do
      test_todo = Todo.new({:id => 1, :description => "scrub the zebra"})
      test_todo.save()
      expect(Todo.all()).to(eq([test_todo]))
    end
  end

  describe('.clear') do
    it('clears the todo list array') do
      test_todo = Todo.new({:id => 1, :description => "scrub the zebra"})
      test_todo.save()
      Todo.clear()
      expect(Todo.all()).to(eq([]))
    end
  end
end
