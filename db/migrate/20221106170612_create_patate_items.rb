class CreatePatateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :patate_items do |t|

      t.timestamps :time
	  t.float :value
    end
  end
end
