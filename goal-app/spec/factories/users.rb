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
FactoryBot.define do
    factory :user do
        username {Faker::Movies::StarWars.character}
        password {'password'}
        factory :darth_vader do
            username {"Darth Vader"}
        end
    end
end
