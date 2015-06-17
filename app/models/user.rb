class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  belongs_to  :role
  has_many    :jobs, :dependent => :destroy

  # Validations
  validates :email,         presence: true, uniqueness: true, format: { with: EMAIL_REGEX }, length: { in: 5..250 }
  validates :username,      presence: true, uniqueness: true, length: { maximum: 250 }
  validates :first_name,    presence: true, length: { maximum: 250 }
  validates :last_name,     length: { maximum: 250 }
  validates :phone,         length: { maximum: 20 }
  validates :address_line1, length: { maximum: 250 }
  validates :address_line2, length: { maximum: 250 }
  validates :post_town,     length: { maximum: 250 }

  # Callbacks
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "Customer" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def customer?
    self.role.name == "Customer"
  end

  def guest?
    self.role.name == "Guest"
  end
end



