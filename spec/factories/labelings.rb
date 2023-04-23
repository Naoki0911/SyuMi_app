FactoryBot.define do
  factory :task_label do
    association :sake
    association :label
  end
end