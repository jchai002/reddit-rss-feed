FactoryGirl.define do
  factory :feed do
    query {
      ("#{['puppy', 'code', 'espresso', 'poland', 'news', 'books'].sample}")
    }

    factory :invalid_feed do
      query nil
    end

  end
end
