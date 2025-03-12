FactoryBot.define do
  factory :section do
    content { 'test' }
    type { 'Section::Default' }
    post { association :post }

    trait :important do
      type { 'Section::Important'}
    end
  end
end
