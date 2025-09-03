class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :bigint do |t|
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
