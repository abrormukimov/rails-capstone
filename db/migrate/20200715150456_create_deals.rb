# frozen_string_literal: true

class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals, &:timestamps
  end
end
