class CreateTemporaries < ActiveRecord::Migration[7.1]
  def change
    create_table :temporaries do |t|
      t.datetime :expiration

      t.timestamps
    end
  end
end
