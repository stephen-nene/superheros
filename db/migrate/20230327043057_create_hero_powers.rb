class CreateHeroPowers < ActiveRecord::Migration[6.1]
  def change
    create_table :hero_powers do |t|
      t.references :hero, null: false, foreign_key: true
      t.references :power, null: false, foreign_key: true

      t.timestamps
    end
  end
end
