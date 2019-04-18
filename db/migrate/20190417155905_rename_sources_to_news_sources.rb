class RenameSourcesToNewsSources < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :sources, :news_sources
  end
end
