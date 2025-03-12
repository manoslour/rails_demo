FactoryBot.define do
  factory :user do
    username { 'Test' }
    email { 'test@demo.com' }
    password { '12345678' }

    trait :valid do
    end

    trait :invalid do
      password { '' }
    end
  end
end
