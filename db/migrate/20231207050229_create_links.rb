class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :slug
      t.string :original

      t.timestamps
    end
  end
end
