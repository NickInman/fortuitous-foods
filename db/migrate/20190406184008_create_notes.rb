class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
    end
  end
end
