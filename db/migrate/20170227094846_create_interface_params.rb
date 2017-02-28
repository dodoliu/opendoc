class CreateInterfaceParams < ActiveRecord::Migration[5.0]
  def change
    create_table :interface_params do |t|
      t.integer :interface_id, comment: '接口id'
      t.string :sid, limit: 50, comment: 'sid'
      t.string :param_name, limit: 25, comment: '参数名称' 
      t.string :param_type, limit: 25, comment: '参数类型'
      t.string :param_desc, limit: 200, comment: '参数描述'
      t.boolean :param_must, comment: '是否必须参数, 0:非必须,1:必须'
      t.integer :status, comment: '状态,0:删除,1:正常'

      t.timestamps
    end
    add_index :interface_params, :id
    add_index :interface_params, [:param_name, :status], :name => 'ix_param_name_status'
  end
end
