json.array!(@payments) do |payment|
  json.extract! payment, :id, :name, :amount
  json.url payment_url(payment, format: :json)
end
