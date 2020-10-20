# frozen_string_literal: true

class CreateDealings < ActiveRecord::Migration[5.2]
  def change
    create_table :dealings do |t|
      t.references :deal, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
