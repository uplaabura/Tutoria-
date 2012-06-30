Feature: Signing in
	
	Scenario: signin failed
		Given visit the signin page
		When the signin information is invalid
		Then show the error messages

	Scenario: signin successful
		Given visit the signin page
		And the user has a account
		And the signin information is valid
	Then show the user profile page
		And show the signout link