FactoryBot.define do
  factory :article do
    title   { "MyString" }
    lead    { "MyText" }
    content { "MyText" }
    premium { false }
    user
  end
end