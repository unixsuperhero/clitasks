story 'This is the second story' do
  id 2
  status started
  points 6
  created_by :josh
  assigned_to :josh, :paul
  tags 'hello', 'world'
  description <<-DESCRIPTION
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
    Here is the second story.  Lorem ipsum, isn't this awesome?
  DESCRIPTION

  comment :josh, <<-BODY.gsub(/^\s\s*/, '')
    this is the first comment
  BODY

  comment :josh, <<-BODY.gsub(/^\s\s*/, '')
    this is another comment
  BODY
end
