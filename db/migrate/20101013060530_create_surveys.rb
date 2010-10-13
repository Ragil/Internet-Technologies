class CreateSurveys < ActiveRecord::Migration
  def self.up
		create_table :surveys do |t|
			t.string:username
			t.string:title
			t.string:description
			t.string:published
      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
