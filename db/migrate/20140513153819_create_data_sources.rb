class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.string :name,        limit: 1024
      t.string :transformer, limit: 255
      t.text   :description
      t.string :status,      limit: 25,   default: 'DEFINED'
      t.string :encoding,    limit: 25,   default: 'utf8'

      t.timestamps
    end

    add_index :data_sources, :name, unique: true
    add_index :data_sources, [:transformer]
    add_index :data_sources, [:status]
  end
end
