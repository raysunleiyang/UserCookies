class CreateTableTags < ActiveRecord::Migration
def change
      create_table :tags do |t|
      t.string :tag,:limit => 256, :null => true
      t.datetime :createdDate ,:null => false
      t.string :createdBy ,:limit => 256, :null => false
      t.datetime :modifitedDate ,:null => false
      t.string :modifitedBy, :limit => 256, :null => false
      t.uuid :uuid,:null => false
      t.timestamps
    end
  add_index :tags, :id
  execute "ALTER TABLE tags ADD CONSTRAINT fk_users_tags FOREIGN KEY (uuid) REFERENCES users(uuid)"
  end
end
