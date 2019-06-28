FactoryBot.define do
  factory :short_link do
    original_url { 'https://www.example.com/really/long/path?with=query_params' }

    trait :expired do
      expires_at { 1.second.ago }
    end
  end
end
