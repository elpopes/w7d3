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
FactoryBot.define do
  factory :user do
    username { "MyString" }
    password_digest { "MyString" }
    password { "MyString" }
    session_token { "MyString" }
  end
end