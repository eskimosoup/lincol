class Contact
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :email, :message, :telephone, :company_name

  validates :name, :message, :email, presence: true
end
