class AddIndexToGitosisPublicKeys < ActiveRecord::Migration
  def self.up
    add_index :gitosis_public_keys, :user_id
  end

  def self.down
    remove_index :gitosis_public_keys, :user_id
  end
end
