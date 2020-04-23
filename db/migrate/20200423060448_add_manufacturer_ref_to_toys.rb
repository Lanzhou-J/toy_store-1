class AddManufacturerRefToToys < ActiveRecord::Migration[6.0]
  def change
    add_reference :toys, :manufacturer, null: false, foreign_key: true
  end
end
