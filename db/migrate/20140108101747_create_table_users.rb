class CreateTableUsers < ActiveRecord::Migration
enable_extension "uuid-ossp"
  def change
    create_table :users, :id => false do |t|
      t.primary_key :uuid, 'uuid',:index => true, :default => 'uuid_generate_v1()',:null => false
      t.string :email, :limit => 320, :null => true
      t.datetime :dueDate, :null => true
      t.text :originalReferringUrl, :null => true
      t.integer :userId, :null => true
      t.datetime :createdDate, :null => false
      t.string :createdBy, :limit => 256, :null => false
      t.datetime :modifitedDate, :null => false
      t.string :modifitedBy, :limit => 256, :null => false
      t.timestamps
    end
  end
end
