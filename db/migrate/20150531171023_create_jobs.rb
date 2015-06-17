class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.date :ideal_start_date
      t.datetime :completed_on
      t.text :description
      t.text :additional_info
      t.boolean :featured
      t.binary :image
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
