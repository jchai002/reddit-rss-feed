FactoryGirl.define do
  factory :feed do
    query {
      ("#{['Puppy', 'Code', 'Espresso', 'Hanggliding', 'Poland'].sample}")
    }

    factory :invalid_feed do
      query nil
    end
    
  end
end
