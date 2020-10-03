class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :statement
      t.string :text
      t.string :answer
      t.integer :daily_access
      t.string :discipline

      t.timestamps
    end
  end
end
