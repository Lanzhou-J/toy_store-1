class AddUserToToys < ActiveRecord::Migration[6.0]
  def change
    add_reference :toys, :user, index: true, foreign_key: true
  end
end
