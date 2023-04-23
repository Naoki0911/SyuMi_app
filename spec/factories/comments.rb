FactoryBot.define do
  factory :comment do
    reply { 'example_comment' }
    association :user
    association :sake
  end
end