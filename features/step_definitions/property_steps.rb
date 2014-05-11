### UTILITY METHODS ###



### WHEN ###

When /^I create a new property$/ do
  visit root_path
  sign_in
  page.should have_content "My Properties"
  find('#properties').hover
  click_link 'New'
 end

### THEN ###

Then /^the property is created$/ do
  page.should have_content "Logout"
end
