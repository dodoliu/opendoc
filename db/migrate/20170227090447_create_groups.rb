class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :sid, limit: 50, comment: 'sid'
      t.string :group_name, limit: 50, comment: '品牌名称'
      t.integer :status, comment: '状态,0:删除,1:正常'
      t.string :memo, limit: 500, comment: '品牌备注'

      t.timestamps
    end
    add_index :groups, :id
    add_index :groups, [:group_name, :status], :name => 'ix_name_status'
  end
end
