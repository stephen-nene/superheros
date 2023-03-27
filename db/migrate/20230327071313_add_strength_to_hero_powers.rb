class AddStrengthToHeroPowers < ActiveRecord::Migration[6.1]
  def change
    add_column :hero_powers, :strength, :string
  end
end
