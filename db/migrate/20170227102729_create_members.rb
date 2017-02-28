class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :sid, limit: 50, comment: 'sid'
      t.string :display_name, limit: 50, comment: '显示名称'
      t.integer :status, comment: '状态,0:删除,1:正常'
      t.datetime :expire_date, comment: '有效期'
      t.string :memo, limit: 100, comment: '备注'

      t.timestamps
    end
    add_index :members, :id
    add_index :members, [:display_name, :status], :name => 'ix_display_name_status'
  end
end
