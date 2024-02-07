class CreateWritingSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :writing_samples do |t|
      t.references :writer, null: false, foreign_key: {to_table: :users}
      t.text :body
      t.string :title
      t.string :tags

      t.timestamps
    end
  end
end
