story %q(change how a story's id is retrieved) do
  status finished
  points 1
  created_by 'unixsuperhero'
  assigned_to :unassigned
  tags *%w(cleanup)

  description %q(
    the following process is ugly and unnecessary:

      File.basename(filename).sub(/.rb$/, '')

    which is used to retrieve a story's id by grabbing it's filename without
    the file's extension.  the following is much cleaner:

      File.basename(filename, '.rb')
  )

end
