class AddFamilyToDogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :family, null: false, foreign_key: true
  end
end
