# frozen_string_literal: true

class AddFieldToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :name, :string
    add_column :deals, :amount, :integer
  end
end
