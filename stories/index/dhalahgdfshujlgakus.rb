story %q("clit create <name>" opens the new story in ${EDITOR:-vim}) do
  id 'dhalahgdfshujlgakus'
  status started
  points 1
  created_by :unixsuperhero
  assigned_to :unixsuperhero

  description <<-DESCRIPTION
    Use Kernel#exec so that bin/clit doesn't block waiting for vim to finish
    running.
  DESCRIPTION
end
