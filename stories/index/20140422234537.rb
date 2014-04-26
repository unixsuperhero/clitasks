story %q(clit edit <name|id> will search the ids/names and open the matches in ${EDITOR:-vim}) do
  status finished
  points 3
  created_by :unixsuperhero
  assigned_to :unassigned
  tags :command, :cmd, :shell

  description <<-DESCRIPTION
    The 2nd arg is assumed to be a regex:

    clit edit 'EDI.*vim'
  DESCRIPTION
end
