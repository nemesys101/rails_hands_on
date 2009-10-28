# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def devolve_el_chorizo(contact)
    contact.signed_id
  end
end
