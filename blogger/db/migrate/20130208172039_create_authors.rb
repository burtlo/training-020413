class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
  end
end
