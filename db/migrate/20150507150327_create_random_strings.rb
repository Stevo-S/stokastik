class CreateRandomStrings < ActiveRecord::Migration
  def change
    create_table :random_strings do |t|
      t.string :random_value

      t.timestamps
    end
  end
end
