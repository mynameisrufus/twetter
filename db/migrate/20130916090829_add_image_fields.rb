class AddImageFields < ActiveRecord::Migration
  def self.up
    add_column :tweets, :image_file_name, :string
    add_column :tweets, :image_file_size, :integer
    add_column :tweets, :image_content_type, :string
    add_column :tweets, :image_updated_at, :datetime
  end

  def self.down
  end
end
