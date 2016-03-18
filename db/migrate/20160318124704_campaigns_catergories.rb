class CampaignsCatergories < ActiveRecord::Migration
  def change
  	create_table :campaigns_categories, id: false do |t|
	    t.references :campaign, null: false
	    t.references :category, null: false
	  end
  end
end
