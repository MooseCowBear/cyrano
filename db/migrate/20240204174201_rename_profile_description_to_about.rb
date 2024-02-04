class RenameProfileDescriptionToAbout < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :description, :about
  end
end
