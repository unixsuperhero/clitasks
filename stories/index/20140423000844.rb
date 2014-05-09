story %q(strip [_[^[:word:]]+ from the beginning and end of symlink names) do
  status finished
  points 1
  created_by :unixsuperhero
  assigned_to :unassigned
  tags :cmd, :command, :rebuild

  description <<-DESCRIPTION
    Right now some of the symlinks' names are:
      _something_holy_wow
      _even_worse_
      asdf_asdf_

    This is just ugly and unnecessary
  DESCRIPTION
end
