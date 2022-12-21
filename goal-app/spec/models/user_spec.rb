# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string
#  password_digest :string
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do 
    User.create(
      username: 'aa@io.com',
      password_digest: 'password'
    )
  end

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}

  describe "uniqueness" do
    before :each do 
        User.create(username: user.username, password_digest: user.password_digest)
    end
    it {should validate_uniqueness_of(:username)}
  end

  describe "#is_password?" do
    it "should verify password is correct" do
      expect(user.is_password?('password')).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session_token for the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_session_token)
    end

    it "returns a new session_token" do 
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do 
    before { user.save! }
    
    it "returns user given good credentials" do
      expect(User.find_by_credentials(user.username, "password")).to eq(user) 
    end
  
    it "returns nil given bad credentials" do
      expect(User.find_by_credentials(user.username, "notpassword")).to be_nil 
    end
  
  end
end
