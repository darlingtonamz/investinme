class AddUploadToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :upload, :string
  end
end
