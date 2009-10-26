require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^no contacts$/ do
  # pending
end

Then /^I should have a contact with "([^\"]*)" as "([^\"]*)"$/ do |value, attribute|
  assert !Contact.find(:first, :conditions=> { attribute.to_sym => value }).nil?
end

Given /^an existing contact with "([^\"]*)" as "([^\"]*)"$/ do |value, attribute|
  Contact.create!(attribute.to_sym => value)
end