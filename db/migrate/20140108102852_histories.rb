class Histories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.text :referringUrl, :null => true
      t.text :url, :null => false
      t.float :longitude, :null => false
      t.float :latitude, :null => false
      t.datetime :createdDate ,:null => false
      t.string :createdBy ,:limit => 256, :null => false
      t.datetime :modifitedDate ,:null => false
      t.string :modifitedBy, :limit => 256, :null => false
      t.uuid :uuid,:null => false
      t.timestamps
    end
    add_index :histories, :id
    execute "ALTER TABLE histories ADD CONSTRAINT fk_users_histories FOREIGN KEY (uuid) REFERENCES users(uuid)"
  end
end
