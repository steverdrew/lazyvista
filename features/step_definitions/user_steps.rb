### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_admin_user
  @admin_user ||= { :name => "Testy Admin", :email => "admin@example.com", :admin => true,
    :password => "changeme", :password_confirmation => "changeme" }
  delete_admin_user 
  @user = FactoryGirl.create(:user, @admin_user)
  @user.confirm!
end

def delete_admin_user
  @user ||= User.where(:email => @admin_user[:email]).first
  @user.destroy unless @user.nil?
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
  @user.confirm!
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  create_visitor
  delete_user
  visit root_path
  click_link 'Sign up'
  #fill_in "First name", :with => @visitor[:first_name]
  #fill_in "Last name", :with => @visitor[:last_name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Password confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit root_path
  click_link "Login"
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

def sign_in_as_admin
  visit root_path
  click_link "Login"
  fill_in "Email", :with => @admin_user[:email]
  fill_in "Password", :with => @admin_user[:password]
  click_button "Sign in"
end

def edit_account
  click_link "Account"
  fill_in "Email", :with => "example@example.com"
  #fill_in "First name", :with => @visitor[:first_name]
  #fill_in "Last name", :with => @visitor[:last_name]
  fill_in "Password", :with => "newpassword"
  fill_in "Password confirmation", :with => "newpassword"
  fill_in "Current password", :with => @visitor[:password]
  click_button "Update"
end

def request_new_confirmation_email
  visit root_path
  click_link "Sign up"
  click_link "Didn't receive confirmation instructions?"
  fill_in "Email", :with => @visitor[:email]
  click_button "Resend confirmation instructions"
  page.should have_content "You will receive an email with instructions about how to confirm your account in a few minutes."
end

### GIVEN ###
Given /^I am not a user$/ do
  sign_up
end

Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

Given /^I exist as an admin user$/ do
  create_admin_user
end


### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
   edit_account
end

When /^I look at the list of users$/ do
  visit '/'
end

When /^I am on the login page$/ do
   visit '/users/sign_in'
end

When /^I am on the account page$/ do
   visit '/users/edit'
end

When /^I sign in as an admin user$/ do
  sign_in_as_admin
end

When /^I delete my account$/ do
  visit root_path
  click_link 'Account'
  click_button 'Cancel my account'
  #TODO
end


### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

Then /^I click on the main logo$/ do
   click_link "Home"
end

Then /^I see the home page$/ do
   page.should have_content "Welcome Home"
end

Then /^I should see a confirmation link message to activate my account$/ do
  page.should have_content "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
end

Then /^I require a new confrmation email$/ do
  request_new_confirmation_email
end

Then /^I see the admin section$/ do
  page.should have_content "Admin"
end

Then /^I should not see the admin section$/ do
  page.should_not have_content "Admin"
end