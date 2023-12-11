class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :short_link
      t.string :original_link
      t.string :category
      t.string :slug
      t.string :password
      t.string :expiration

      t.timestamps
    end
  end
end
