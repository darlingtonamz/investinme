class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.references :user, 
      t.string :name
      t.text :goal
      t.integer :cost

      t.timestamps null: false
    end
  end
end
