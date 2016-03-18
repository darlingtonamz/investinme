class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references 	:user
    	t.references 	:campaign
      	t.text 			:body

      	t.timestamps null: false
    end
  end
end
