class AddDataToCategories < ActiveRecord::Migration
  def up
  	execute("INSERT INTO categories (name, created_at, updated_at) VALUES
      ('Wood', now(), now()),
      ('Metal', now(), now()),
      ('Fashion', now(), now()),
      ('Agriculture', now(), now()),
      ('Art', now(), now())"
    );
  end
  
  def down
  end
end
