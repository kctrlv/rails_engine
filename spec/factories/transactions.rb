FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number 1001100110011001
    credit_card_expiration_date '01/16'
    result 'success'
  end
end
