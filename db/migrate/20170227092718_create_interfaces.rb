class CreateInterfaces < ActiveRecord::Migration[5.0]
  def change
    create_table :interfaces do |t|
      t.integer :group_id, comment: '品牌关联id'
      t.string :sid, limit: 50, comment: 'sid'
      t.string :interface_name, limit: 50, comment: '接口名称'
      t.string :domain, limit: 100, comment: '域名'
      t.string :product_url, limit: 200, comment: '生产url'
      t.string :test_url, limit:200, comment: '测试url'
      t.string :request_type, limit: 20, comment: '请求方式'
      t.string :response_type, limit: 20, comment: '返回值格式'
      t.string :response_content, limit: 1000, comment: '返回结果'
      t.integer :status, comment: '状态,0:删除,1:正常'
      t.text :demo, comment: '调用示例'

      t.timestamps
    end
    add_index :interfaces, :id
    add_index :interfaces, [:interface_name, :status], :name => 'ix_interface_name_status'
  end
end
