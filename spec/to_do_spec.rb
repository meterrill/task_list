require('rspec')
require('pg')
require('to_do')

describe(Todo) do

  describe("#description") do
    it("lets you give it a description") do
      test_todo = Todo.new({:description => "scrub the zebra"})
      expect(test_todo.description).to(eq("scrub the zebra"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Todo.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves description') do
      test_todo = Todo.new({:description => "scrub the zebra"})
      test_todo.save()
      expect(Todo.all()).to(eq([test_todo]))
    end
  end

  describe('.clear') do
    it('clears the todo list array') do
      test_todo = Todo.new({:description => "scrub the zebra"})
      test_todo.save()
      Todo.clear()
      expect(Todo.all()).to(eq([]))
    end
  end

  describe("#==") do
    it('is the same todo if it has the same description') do
      todo1 = Todo.new({:description => "scrub the zebra"})
      todo2 = Todo.new({:description => "scrub the zebra"})
      expect(todo1).to(eq(todo2))
    end
  end
end

DB = PG.connect ({:dbname => 'todo_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM description *;")
  end
end
