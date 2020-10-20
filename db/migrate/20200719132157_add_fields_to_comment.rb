# frozen_string_literal: true

class AddFieldsToComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :title, :name
  end
end
