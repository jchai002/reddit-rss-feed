FactoryGirl.define do
  factory :feed do
    query {
      ("#{Faker::App.name}")
    }

    factory :invalid_feed do
      query nil
    end

  end
end
