class AddSpecialtiesToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :specialties, :text
  end
end
