class CreateRegulars < ActiveRecord::Migration[7.1]
  def change
    create_table :regulars do |t|

      t.timestamps
    end
  end
end
