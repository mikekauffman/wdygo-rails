require 'spec_helper'

describe User do
  it "A users can be created" do
    user = User.create!(first_name: "Mike", last_name: "Kauffman", email: "goin2na@hotmail.com", password: "password")
    expect(user).to be_valid
  end
end