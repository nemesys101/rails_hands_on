module StiExtensions
  private
  # Override the protection for inheritance column assigment.
  # the type can be assigned if the instance is new_record?
  def attributes_protected_by_default
    if self.new_record?
      default = [ self.class.primary_key ]
      default << 'id' unless self.class.primary_key.eql? 'id'
      default
    else
      super
    end
  end
 
end