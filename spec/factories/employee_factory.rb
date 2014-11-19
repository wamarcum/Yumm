FactoryGirl.define do

  factory :employee do
    name "bob"
    pin "55"
    manager false
  end

  factory :manager, class: Employee do
    name "bobager"
    pin "44"
    manager true
  end

end

