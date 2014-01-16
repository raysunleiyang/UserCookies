require File.expand_path("../../spec_helper", __FILE__)

#test command
#bundle exec rspec spec/models/tag_spec.rb

describe "Tag"  do

  subject { Tag.new }

  it {should respond_to(:uuid)}
  it {should respond_to(:tag)}
  it {should respond_to(:createdDate)}
  it {should respond_to(:createdBy)}
  it {should respond_to(:modifitedDate)}
  it {should respond_to(:modifitedBy)}

end