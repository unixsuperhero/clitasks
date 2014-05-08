story %q(open stories in $EDITOR if task search ends in -e switch) do
  status finished
  points 1
  created_by 'unixsuperhero'
  assigned_to :unassigned
  tags *%w(task bin edit search)

  description %q(
  This will fit into my workflow better.

  I will typically do this:

  task search testing-pattern-1 testing-pattern-2
  # if it lists the stories i wanted it to list, i switch to:
  task edit testing-pattern-1 testing-pattern-2

  this is a pain though, to move the cursor somewhere in the middle of the
  previous command.  instead i want to just be able to type this:
  <ctrl-p> -e

  or even:
  !! -e

  so the workflow would look like this:

  task search patterns
  task search patterns -e
  )
end
