class CreateReposFiles < ActiveRecord::Migration
  def change
    create_table :repos_files do |t|
      t.attachment :file

      t.timestamps null: false
    end
  end
end
