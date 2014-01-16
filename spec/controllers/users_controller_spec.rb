require File.expand_path("../../spec_helper", __FILE__)

#test command
#bundle exec rspec spec/controllers/users_controller_spec.rb

describe UsersController do
  
  before(:each) do
       @expected_user = User.create(
      :email=>"unit_test", 
      :dueDate=>"2014-1-1", 
      :originalReferringUrl=>"google.com", 
      :userId=>"999", 
      :createdDate=>"2014-1-1", 
      :createdBy=>"ray", 
      :modifitedDate=>"2014-1-1", 
      :modifitedBy=>"sun") 
  end
  
  describe "index action" do
    
    it "should have same record count" do
      get :index, :format=>:json
      json_array = JSON.parse(response.body)
      expect(json_array.length.should).to eq User.count
    end
  end
  
  describe "show action" do
    
    it "shoule have some json result" do
      get :show, :id=> @expected_user.uuid, :format=>:json
      json_comparer(response.body,@expected_user)
    end
  end
  
  describe "create action" do
    
  it "should have same record count" do
  request_body = {
      :email=>"unit_test", 
      :dueDate=>"2014-1-1", 
      :originalReferringUrl=>"google.com", 
      :userId=>"999", 
      :createdDate=>"2014-1-1", 
      :createdBy=>"ray", 
      :modifitedDate=>"2014-1-1", 
      :modifitedBy=>"sun"}
  expect{post :create, :user=> request_body ,:format=>:json}.to change(User, :count).by(1)
  end
end

  describe "update action" do

  it "should have same json result" do
    
    request_body = @expected_user.to_json
    request_body = JSON.parse(request_body)
    request_body["email"]= "change_email"
    
  put :update, :id=> @expected_user.uuid, :user=> request_body, :format=>:json
  @expected_user= User.find(@expected_user.uuid)
  json_comparer(response.body,@expected_user)
  
  end
end
  
  describe "destroy action" do
    
    it "should increment the users count " do
    expect{ delete :destroy, :id => @expected_user.uuid, :format=>:json}.to change(User, :count).by(-1)
  end
end  

private

  def json_comparer(respones_body,expected_user)
  
  target_user_json = JSON.parse(respones_body)
  target_user_json.delete("tags")
  target_user_json.delete("history")
  
  expect(target_user_json).to eq JSON.parse(expected_user.to_json)

  end

end

