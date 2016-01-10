FactoryGirl.define do
  factory :favorite do
    link {
      ("#{Faker::Internet.url}")
    }
    title {
      ("#{Faker::Lorem.sentence}")
    }
    date {
      ("#{Faker::Date.backward(14)}")
    }

    factory :invalid_favorite do
      link nil
      title nil
      date nil
    end

  end
end
