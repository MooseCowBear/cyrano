class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username, index: {unique: true}
      t.string :display_name
      t.text :description

      t.timestamps
    end
  end
end
