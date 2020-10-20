# frozen_string_literal: true

class AddFieldsToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :user_id, :integer
  end
end
