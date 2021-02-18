class CreateDoses < ActiveRecord::Migration[6.1]
  def change
    create_table :doses do |t|
      t.string :description

      t.timestamps
    end
  end
end
