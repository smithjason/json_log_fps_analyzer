class AddAverageFpsToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :average_fps, :integer
  end
end
