class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      #
      # sti field
      #
      t.string :type
      
      # contact associations
      t.belongs_to :contact
      
      # model fields
      t.string :name
      t.string :protocol
      
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
