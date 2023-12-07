class CreateEphemerals < ActiveRecord::Migration[7.1]
  def change
    create_table :ephemerals do |t|
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
