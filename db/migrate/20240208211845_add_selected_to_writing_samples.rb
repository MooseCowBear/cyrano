class AddSelectedToWritingSamples < ActiveRecord::Migration[7.0]
  def change
    add_column :writing_samples, :selected, :boolean, default: false
  end
end
