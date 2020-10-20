# frozen_string_literal: true

class AddUserToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :user_id, :integer
  end
end
