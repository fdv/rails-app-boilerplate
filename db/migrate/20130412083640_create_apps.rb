class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.text   "settings"
    end
  end
end
