class CreateSports < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|
      t.string :team
      t.string :city
      t.integer :fanbase_loyalty
      t.string :market_size

      t.timestamps
    end
  end
end
