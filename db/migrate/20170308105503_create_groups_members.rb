class CreateGroupsMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_members, id: false do |t|
      t.integer :group_id
      t.integer :member_id
    end
    add_index :groups_members, [:group_id, :member_id], name: 'ix_group_id_member_id'
  end
end
