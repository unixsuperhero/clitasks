
# CliTasks (clit)

Clit is a (C)ommand-(L)ine (I)nterface (T)ask Manager for Projects

It is being developed with the following goals in mind:

* allow developers to view and manage tasks without leaving their terminal
* decentralized
    * similar to how local-copies of git repos float around
    * the list of "stories", who is working on what, and the status can follow the codebase and all sync with any _master_ branch
* clean document format

# Plans

* REPL-style interactive console for viewing/updating stories
* Some intuitive story navigator, list by type, open in vim, etc.
* Shell integration
  * create new stories
  * change their status
  * git integration (not sure if i like this)
    * starting a story could create a feature branch
    * finishing it, merge into master
* Vim integration
  * change a story's status, etc.
  * who knows?

# Show that it works

    ./bin/clit

# Example Story File:

    story 'Change the Homepage title to say "Foo"' do
      id 'ajsdfjsjs'
      status queued  # new is a reserved word
      created_by :unix_superhero
      assigned_to :unix_superhero, 'Foo Bar', :someone_else
      tags :test, 'tag_two', :three

      description <<-DESCRIPTION
        Lorem ipsum, and stuff...

        A long description can go here.
          
        To Do:
        * task one
        * task two
      DESCRIPTION

      comment 'Unix Superhero', <<-COMMENT
        Hai hai, sou desu ne?
      COMMENT

      comment 'Foo Bar', <<-COMMENT
        When will this be done?
      COMMENT
    end
