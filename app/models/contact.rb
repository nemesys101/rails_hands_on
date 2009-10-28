class Contact < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email, :message => "como no tenes email?"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  belongs_to :group
  has_many :addresses, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :reject_if => proc { |attributes| attributes['name'].blank? }
  
  def self.find_by_signature(secret)
    return nil unless secret.kind_of?(String)
    id, signature = secret.split('-')
    contact = self.find(id)
    raise ActiveRecord::RecordNotFound if signature != self.sign(contact.id)
    contact
  end

  def self.sign(id, length=8)
    Digest::SHA1.hexdigest([self, id, SECRET].join)[0, length]
  end
  
  def signed_id
    "#{self.id}-#{self.class.sign(self.id)}"
  end
  
  def full_name
    "#{self.first_name} #{self.last_name.upcase}"
  end
end
