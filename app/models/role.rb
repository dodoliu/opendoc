class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify


  enum status: [:archived, :active]

  #validates
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }

  #scope
  default_scope { where("status>?", Role.statuses[:archived]) }
  scope :name_like, ->(name){ where "name like ? ", "%#{sanitize_sql_like(name)}%" }  #防sql注入

  #假删除
  def self.delete(role)
    role.status = :archived    
    role.save
  end

  #设置属性值
  def self.set_attribute(role_params)
    role = Role.new(role_params)
    role.status = :active      
    role
  end


end
