story %q(gem notes: suggest the current .gitignore settings to avoid ridiculous commits) do
  status queued
  points 1
  created_by :unixsuperhero
  assigned_to :unassigned
  tags :gem, :setup

  description <<-DESCRIPTION
    The current .gitignore is set to this:

    -- .gitignore: -----------------------
    stories/*
    !stories/index
    --------------------------------------

    This way only the actual story files are committed.  All of the symlinks
    are ignored.
  DESCRIPTION
end
