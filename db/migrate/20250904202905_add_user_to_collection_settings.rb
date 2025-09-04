class AddUserToCollectionSettings < ActiveRecord::Migration[8.0]
  def change
    add_reference :collection_settings, :user, null: false, foreign_key: true, type: :bigint
  end
end
