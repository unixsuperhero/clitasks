require './test/test_helper'

describe CliTasks do
  describe 'TEST_VERSION' do
    it 'should exist' do
      CliTasks::TEST_VERSION.must_be :present?
    end

    it 'should equal v0.0.1' do
      CliTasks::TEST_VERSION.must_equal '0.0.1'
    end
  end

  describe 'CliTasks::VERSION' do
    it 'should be a string' do
      CliTasks::VERSION.class.must_equal String
    end

    it 'should match the SEMVER format' do
      CliTasks::VERSION.must_match /^\d+\.\d+\.\d+/
    end
  end
end
