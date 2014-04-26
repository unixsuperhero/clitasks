story %q(separate lib/story.rb into one file per class) do
  status finished
  points 2
  created_by :unixsuperhero
  assigned_to :unassigned
  tags *%w(refactor gem) # *%w(example example_two)

  description <<-DESCRIPTION
    each class in lib/story.rb should be in its' own file

    the classes are:
    grep 'class ' lib/story.rb
    # class Story
    # class SimpleDSL
    # class StoryReader < SimpleDSL
  DESCRIPTION
end
