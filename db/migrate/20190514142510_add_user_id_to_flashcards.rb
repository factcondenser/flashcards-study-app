class AddUserIdToFlashcards < ActiveRecord::Migration[6.0]
  def change
    add_column :flashcards, :user_id, :integer
    add_index :flashcards, :user_id
  end
end
