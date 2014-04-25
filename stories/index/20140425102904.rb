story %q(bug: fix title not being interpolated in new stories) do
  status finished
  points 1
  created_by :unixsuperhero
  assigned_to :unassigned
  tags *%w() # *%w(example example_two)

  description <<-DESCRIPTION
    When I extracted the new story template into a new file, it broke the title
    interpolation.
  DESCRIPTION
end
