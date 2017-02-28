class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :interface_id, comment: '接口id'
      t.integer :member_id, comment: '用户id'
    end
    add_index :permissions, [:interface_id, :member_id], :name => 'ix_interface_id_member_id'
  end
end
