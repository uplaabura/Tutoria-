Given /^visit the signin page$/ do
	visit start_path
end

When /^the signin information is invalid$/ do
	click_button "Sign in!"
end

Then /^show the error messages$/ do
	page.should have_selector('div.alert.alert-error')
end

Given /^the user has a account$/ do
	@user = User.create(:name => "test01", :email => "test01@test.com",
											:password => "test01", :password_confirmation => "test01")
end	

Given /^the signin information is valid$/ do
	fill_in "Email", 		:with => @user.email
	fill_in "Password", :with => @user.password
	click_button "Sign in!"
end

Then /^show the user profile page$/ do
	page.should have_selector("title", :content => @user.name)
end

Then /^show the signout link$/ do
	page.should have_link("Sign out")
end

