class CreatePrivates < ActiveRecord::Migration[7.1]
  def change
    create_table :privates do |t|
      t.string :password

      t.timestamps
    end
  end
end
