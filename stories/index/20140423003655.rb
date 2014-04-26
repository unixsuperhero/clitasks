story %q(lib/'s structure should match namespaces; one file should load the whole env (see: any gem)) do
  status finished
  points 1
  created_by :unixsuperhero
  assigned_to :unixsuperhero
  tags *%w(gem setup refactor)

  description <<-DESCRIPTION
    lib/* should reflect the namespaces

    the toplevel should have lib/clitasks.rb which is responsible for requiring
    all other lib/**.rb files.  this way, whenever a script needs to use
    clitasks, it is just requiring one file and not a shitload.  also, all the
    other files in lib/ won't have to worry about requiring each other

    also, it could possibly use autoload, that way there aren't any issues with
    one class requiring another before the vm knows where everything is.
  DESCRIPTION
end
