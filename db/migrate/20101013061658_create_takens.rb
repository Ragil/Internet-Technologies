class CreateTakens < ActiveRecord::Migration
  def self.up
    create_table :takens do |t|
			t.string:ip
			t.string:survey_id
      t.timestamps
    end
  end

  def self.down
    drop_table :takens
  end
end
