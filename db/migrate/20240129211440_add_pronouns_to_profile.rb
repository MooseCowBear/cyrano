class AddPronounsToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :pronouns, :string
  end
end
