FactoryGirl.define do
  factory :user do
    email "john@doe.com"
    password "toto42"
    unconfirmed_email nil
    confirmed_at "2013-04-13 18:28:12"
    confirmation_sent_at "2013-04-13 18:25:28"
  end
end