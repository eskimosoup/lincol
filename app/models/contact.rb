class Contact
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :email, :message, :telephone, :company_name, :form

  validates :name, :message, :telephone, presence: true
  validates :email, presence: true, unless: Proc.new{|x| x.form == 'callback' }
end
