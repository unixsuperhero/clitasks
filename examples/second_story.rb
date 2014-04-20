story do
  status :started
  name 'This is the second story'
  description <<-DESCRIPTION
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
  DESCRIPTION

  created_by :josh
  assigned_to :josh, :paul
  tags 'hello', 'world'

  comment :josh, <<-BODY.gsub(/^\s\s*/, '')
    this is another comment
  BODY
end
