class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.string :title, presence: true, uniqueness: true

      t.timestamps
    end
  end
end
