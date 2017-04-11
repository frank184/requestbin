class CreateBins < ActiveRecord::Migration[5.1]
  def change
    create_table :bins do |t|
      t.string :uid

      t.timestamps
    end
  end
end
