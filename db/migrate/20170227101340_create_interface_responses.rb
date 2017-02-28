class CreateInterfaceResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :interface_responses do |t|
      t.string :sid, limit: 50, comment: 'sid'
      t.integer :interface_id, comment: '接口id'
      t.string :response_name, limit: 25, comment: '返回值名称'
      t.string :response_type, limit: 25, comment: '返回值类型'
      t.string :response_desc, limit: 200, comment: '返回值描述'
      t.integer :status, comment: '状态,0:删除,1:正常'

      t.timestamps
    end
    add_index :interface_responses, :id
    add_index :interface_responses, [:response_name, :status], :name => 'ix_response_name_status'
  end
end
