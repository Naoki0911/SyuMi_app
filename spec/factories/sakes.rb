FactoryBot.define do
  factory :sake do
    association :user
    name { "Test Sake" }
    content { "Test Content" }
    place { "東京都" }
    sweetness { 1 }
    flavor { 2 }
    sour { 3 }
    feeling { 4 }
    rich { 5 }

    after(:build) do |sake|
      sake.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end

  factory :second_sake, class: Sake do
    association :user
    name { "Example Sake" }
    content { "Example Content" }
    place { "福岡県" }
    sweetness { 1 }
    flavor { 2 }
    sour { 3 }
    feeling { 4 }
    rich { 5 }

    after(:build) do |sake|
      sake.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end
end