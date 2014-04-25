story %q("task create <title>" does not require title to be a single argument (in quotes)) do
  status finished
  points 1
  created_by :unixsuperhero
  assigned_to :unixsuperhero
  tags *%w(cmd command usability) # *%w(example example_two)

  description <<-DESCRIPTION
    basically just do an:

      args.join(' ')

    when generating the story's name
  DESCRIPTION
end
