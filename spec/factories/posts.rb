FactoryBot.define do
  factory :post do
    title { 'Title' }
    content { 'Content' }

    user { association :user }
  end
end
