FactoryGirl.define do

  factory :employee do
    name "bob"
    pin "12"

    factory :manager do
      manager true
    end
  end

end

