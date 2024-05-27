class Stripe::Customer::Details
  include JSON::Serializable
  getter address : Stripe::Customer::Address?
  getter email : String?
  getter name : String?
  getter phone : String?
  getter tax_exempt : String?
end
