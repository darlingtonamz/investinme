json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :goal, :cost
  json.url campaign_url(campaign, format: :json)
end
