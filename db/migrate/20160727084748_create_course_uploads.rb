class CreateCourseUploads < ActiveRecord::Migration
  def change
    create_table :course_uploads do |t|
      t.attachment :upload
      t.boolean :base
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
