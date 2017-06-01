class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :phone, null: false, index: true
      t.string :password_digest
      t.string :im_info
      t.text :note

      t.timestamps
    end
  end
end
