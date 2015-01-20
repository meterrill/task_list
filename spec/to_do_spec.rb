require('rspec')
require('to_do')

describe(Todo) do
  describe("#description") do
    it("lets you give it a description") do
      test_todo = Todo.new({:description => "scrub the zebra"})
      expect(test_todo.description).to(eq("scrub the zebra"))
    end
  end

  describe('#save') do
    it('saves description') do
      test_todo = Todo.new({:description => "scrub the zebra"})
      test_todo.save()
      expect(Todo.todo_list()).to(eq(test_todo))
    end
  end
end
