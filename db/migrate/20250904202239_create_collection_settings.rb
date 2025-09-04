class CreateCollectionSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :collection_settings, id: :uuid do |t|
      t.string :collection_name
      t.string :institution_code
      t.bigint :latest_collection_code
      t.text :note

      t.timestamps
    end
  end
end
