class AddSummaryToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :summary, :text
  end
end
