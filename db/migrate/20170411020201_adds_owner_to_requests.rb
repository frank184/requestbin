class AddsOwnerToRequests < ActiveRecord::Migration[5.1]
  def up
    change_table :requests do |t|
      t.references :owner, :polymorphic => true
    end
  end

  def down
    change_table :requests do |t|
      t.remove_references :owner, :polymorphic => true
    end
  end
end
