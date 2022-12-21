# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do 
    User.create!(
      email: 'aa@io.com',
      password: 'password'
    )
  end

  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
end
