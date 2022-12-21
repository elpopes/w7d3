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

end
