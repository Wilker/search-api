class CreateQuestionAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :question_accesses do |t|
      t.references :question
      t.datetime :date
      t.integer :times_accessed

      t.timestamps
    end
  end
end
