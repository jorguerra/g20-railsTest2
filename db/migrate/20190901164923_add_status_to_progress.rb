class AddStatusToProgress < ActiveRecord::Migration[5.2]
  def change
    add_column :progresses, :status, :boolean
  end
end
