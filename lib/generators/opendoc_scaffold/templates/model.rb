require 'uuidtools'

class <%= singular_table_name.capitalize %> < ApplicationRecord
  enum status: [:archived, :active]

  #validates
  validates :TODO, presence: true, length: { maximum: 50 }
  validates :TODO, numericality: true

  #scope
  default_scope { where("status>?", <%=  singular_table_name.capitalize %>.statuses[:archived]) }
  scope :name_like, ->(name){ where "name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(<%= singular_table_name %>)
    <%= singular_table_name %>.status = :archived    
    <%= singular_table_name %>.save
  end

  #设置属性值
  def self.set_attribute(<%= singular_table_name %>_params)
    <%= singular_table_name %> = <%= singular_table_name.capitalize %>.new(<%= singular_table_name %>_params)
    <%= singular_table_name %>.sid = UUIDTools::UUID.timestamp_create
    <%= singular_table_name %>.status = :active      
    <%= singular_table_name %>
  end
end
