require 'uuidtools'

class Interface < ApplicationRecord
  belongs_to :group
  has_many :interface_params

  enum status: [:archived, :active]

  #validates
  validates :interface_name, presence: true, length: { maximum: 50 }

  #scope
  default_scope { where("status>?", Interface.statuses[:archived]) }
  scope :name_like, ->(name){ where "interface_name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(interface)
    interface.status = :archived    
    interface.save
  end

  #设置属性值
  def self.set_attribute(interface_params)
    interface = Interface.new(interface_params)
    interface.sid = UUIDTools::UUID.timestamp_create
    interface.status = :active      
    interface
  end
end
