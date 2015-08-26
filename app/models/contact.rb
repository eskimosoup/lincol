class Contact
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :email, :message, :telephone, :company_name, :form

  validates :name, :message, :email, presence: true
end
