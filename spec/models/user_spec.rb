require File.expand_path("../../spec_helper", __FILE__)

#test command
#bundle exec rspec spec/models/user_spec.rb


describe "User" do

  subject{ User.new }

  it { should respond_to(:uuid) }
  it { should respond_to(:email) }
  it { should respond_to(:dueDate) }
  it { should respond_to(:originalReferringUrl) }
  it { should respond_to(:userId) }
  it { should respond_to(:createdDate) }
  it { should respond_to(:createdBy) }
  it { should respond_to(:modifitedDate) }
  it { should respond_to(:modifitedBy) }

end