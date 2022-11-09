class PatateItems < ActiveRecord::Migration[7.0]
  def change
		change_table  :patate_items do |t|
			 t.datetime :time
		  end
	  end
end
