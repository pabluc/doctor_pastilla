class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :medicine
      t.string :email
      t.integer :cadence_minutes
      t.datetime :start

      t.timestamps
    end
  end
end
