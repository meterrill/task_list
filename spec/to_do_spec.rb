require('rspec')
require('to_do')

describe(Todo) do
  describe("#description") do
    it("lets you give it a description") do
      test_todo = Todo.new({:description => "scrub the zebra"})
      expect(test_todo.fetch(:description).to(eq("scrub the zebra"))
    end
  end
end
