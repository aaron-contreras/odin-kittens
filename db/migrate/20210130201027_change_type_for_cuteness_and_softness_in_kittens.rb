# frozen_string_literal: true

# Change data types to strings
class ChangeTypeForCutenessAndSoftnessInKittens < ActiveRecord::Migration[6.1]
  def change
    change_table :kittens do |t|
      t.change :cuteness, :string
      t.change :softness, :string
    end
  end
end
