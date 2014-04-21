story 'name goes here' do
  id 1
  status queued
  points 2

  description <<-DESCRIPTION
    The description for the first story goes here.
    Not sure what I should put here.
  DESCRIPTION

  created_by :josh
  assigned_to :josh

  tags :one, 'two', 'three four'

  comment :josh, <<-BODY.gsub(/^\s\s*/, '')
    Hello world, this is a test.
  BODY
end
