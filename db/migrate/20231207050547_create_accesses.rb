class CreateAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :accesses do |t|
      t.string :ip

      t.timestamps
    end
  end
end
