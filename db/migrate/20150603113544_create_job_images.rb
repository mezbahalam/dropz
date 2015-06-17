class CreateJobImages < ActiveRecord::Migration
  def change
    create_table :job_images do |t|
      t.string :caption
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
