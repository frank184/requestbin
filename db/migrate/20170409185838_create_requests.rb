class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :headers
      t.string :body

      t.timestamps
    end
  end
end
