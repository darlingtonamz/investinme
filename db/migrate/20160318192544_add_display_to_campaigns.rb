class AddDisplayToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :display, :string
  end
end
