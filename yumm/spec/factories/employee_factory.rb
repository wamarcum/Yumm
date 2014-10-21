FactoryGirl.define do

  factory :employee do
    name "bob"
    pin "12"

    factory :manager do
      admin true
    end
  end

end

