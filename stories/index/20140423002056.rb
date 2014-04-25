story %q(safety: do not FileUtils.rm_r the dirs with the symlinks...only .rm the symlinks) do
  status finished
  points 1
  created_by :unixsuperhero
  assigned_to :unassigned
  tags *%w(cmd command rebuild safety improvement)

  description <<-DESCRIPTION
    First of all, rm -rf is not safe to run.  If clit accidentally removes
    important directories, I don't want to be held responsible.

    It is fine to leave old folders there.  For example, a tag folder with no
    more stories.  This will tell the team, hey we used to tag stuff with this.

    Make sure the file is a symlink before removing it.  This is another safety
    measure.
  DESCRIPTION
end
