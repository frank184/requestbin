class CreateBins < ActiveRecord::Migration[5.1]
  def change
    create_table :bins do |t|
      t.string :uuid

      t.timestamps
    end
  end
end
