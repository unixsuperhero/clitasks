story %q(task search (-s|--simple) [regex1[, regex2[, ...]]] for listing the grep results only) do
  status finished
  points 1
  created_by :unixsuperhero
  assigned_to :unixsuperhero
  tags *%w(cmd command search grep list)

  description <<-DESCRIPTION
    > task search [regex1[, regex2[, ...]]]
    this will list stories like normal, but only stories matching the regexps

    > task search -s [regex1[, regex2[, ...]]]
    > task search --simple [regex1[, regex2[, ...]]]
    these will list only the filenames for the stories matching the regexps
  DESCRIPTION
end
