require 'minitest/autorun'
require './lib/clitasks'

describe 'New methods added to String class' do
  let(:sample) { 'Hello World!  This Is a @#$%&ing test' }

  describe '#underscore' do
    it 'should take any consecutive \W and sub with a single ?_' do
      sample.underscore.must_equal 'Hello_World_This_Is_a_ing_test'
    end
  end
  describe '#strip_chr' do
    it 'should remove any char passed in from beginning or end' do
      sample.strip_chr('Hest ').must_equal 'llo World!  This Is a @#$%&ing'
    end
  end
  describe '#sanitize' do
    it 'should sub any consecutive \W with spaces' do
      sample.sanitize.must_equal 'Hello World This Is a ing test'
    end
  end
  describe '#pathify' do
    it 'should downcase the string' do
      sample.pathify.match(/[A-Z]/).must_equal nil
    end
    it 'should convert consecutive \W into a single underscore' do
      sample.pathify.match(/\W/).must_equal nil
      sample.pathify.match(/\W\W+/).must_equal nil
      sample.pathify[/_/].must_equal '_'
    end
    it 'should remove any leading or trailing underscores' do
      '_has leading and trailing underscores_'.pathify.match(/^_/).must_equal nil
      '_has leading and trailing underscores_'.pathify.match(/_$/).must_equal nil
    end
    it 'should return an exceptable filename' do
      sample.pathify.must_equal 'hello_world_this_is_a_ing_test'
    end
  end
end
