class AddWriterReferenceToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :writer, null: false, foreign_key: {to_table: :users}
  end
end
