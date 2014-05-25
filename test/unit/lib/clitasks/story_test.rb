require './test/test_helper'

describe CliTasks do
  describe CliTasks::Story do
    describe '#initialize' do
      it 'should copy instance variables' do
        o = Object.new.tap{|obj|
          obj.instance_variable_set(:@name, 'Lorem Ipsum Feature')
          obj.instance_variable_set(:@status, :finished)
        }
        story = CliTasks::Story.new(o)
        story.name.must_equal 'Lorem Ipsum Feature'
        story.status.must_equal :finished
      end
    end

    describe '#id' do
      it 'should return basename without .rb' do
        story = CliTasks::Story.new(Object.new)
        story.file = 'stories/index/base_name.rb'
        story.id.must_equal 'base_name'
      end
    end
  end
end
