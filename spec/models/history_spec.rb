require File.expand_path("../../spec_helper", __FILE__)

#test command
#bundle exec rspec spec/models/history_spec.rb

describe "History"  do

  subject { History.new }

  it {should respond_to(:referringUrl)}
  it {should respond_to(:url)}
  it {should respond_to(:longitude)}
  it {should respond_to(:latitude)}
  it {should respond_to(:createdDate)}
  it {should respond_to(:createdBy)}
  it {should respond_to(:modifitedDate)}
  it {should respond_to(:modifitedBy)}
  it {should respond_to(:uuid)}

end