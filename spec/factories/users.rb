FactoryBot.define do
  factory :user do
    username { 'Test' }

    sequence(:email) { |n| "person#{n}@example.com" }

    password { '12345678' }

    trait :valid do
    end

    trait :invalid do
      password { '' }
    end
  end
end
