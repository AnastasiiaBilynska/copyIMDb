FactoryBot.define do

    factory :movie do
      title { Faker::Lorem.words(number: 4) }
      text { Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4) }
      category_id { 1 }
    end

  end
