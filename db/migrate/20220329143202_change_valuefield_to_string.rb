class ChangeValuefieldToString < ActiveRecord::Migration[7.0]
  def change
    change_column :challenges, :value, :string
  end
end
