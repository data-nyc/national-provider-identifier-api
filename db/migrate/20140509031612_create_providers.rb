class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :npi,                    limit: 10, null: false
      t.string :entity,                 limit: 25, null: false
      t.string :ein
      t.string :legal_name,             limit: 255, null: false
      t.string :first_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.string :credential
      t.datetime :enumerated_at
      t.datetime :last_updated_at
      t.string :deactivated_reason_code
      t.datetime :deactivated_at
      t.datetime :reactivated_at
      t.string :gender_code

      t.timestamps
    end

    add_index :providers, :npi, unique: true
    add_index :providers, [:entity, :legal_name]
  end
end
