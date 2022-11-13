class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :follower, index: true, foreign_key: { to_table: :users }
      t.references :followed, index: true, foreign_key: { to_table: :users }
    end
  end
end
