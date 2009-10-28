class Twitter < Address
  before_create :set_kind
  def set_kind
end