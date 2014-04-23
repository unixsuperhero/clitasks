story %q(use %w() as the default tags argument or *%w()) do
  status finished
  points 1
  created_by :unixsuperhero
  assigned_to :unassigned
  tags *%w(tags)

  description <<-DESCRIPTION
    I like this more than than symbols or strings separated by commas.

    It allows the user to just run off a list of tags

    Might want to either:
    * splat the argument:
        tags *%w(one two three)
    * or flatten it within the StoryBuilder#tag definition

    I think I like the former option.
  DESCRIPTION
end
