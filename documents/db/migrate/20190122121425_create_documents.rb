class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :description
      t.text :content

      t.timestamps
    end
  end
end
