
<a href="https://codeclimate.com/repos/56cfb20278a2e5008500347f/feed"><img src="https://codeclimate.com/repos/56cfb20278a2e5008500347f/badges/e531666b51edf2494ca9/gpa.svg" /></a>
										
					-----------------------------------
					CONTACT MANAGER AND SMS APPLICATION
					-----------------------------------


This application is a console application for managing contacts. It has the following functionality:

•	Creation of a new contacts database or access to an existing one 

•	Addition of contacts to the database

•	Ability to search for any contact on the database

•	Ability to send on way SMS to people in the contact list.


The application has an interactive command line interface that forms a relationship with the user 
of the application. Note that the database system used is SQLite database system.
					
					-----------------------------------------
					LIST OF VALID COMMANDS IN THE APPLICATION
					-----------------------------------------

•	TO ADD A CONTACT: add -n [FirstName] [LastNAme] -p [PhoneNumber]

•	TO SEARCH FOR A CONTACT: search [name]

•	TO SEND AN SMS: text [recipient] -m [message] 

•	TO SEE ALL CONTACTS: list

•	TO SEE ALL COMMANDS: HELP

•	TO EXIT: exit 


Ruby gems that need to be installed to use this app include:

•	Colorize

•	Sqlite3	(see specifications before you install this gem)

						--------------
						SPECIFICATIONS
						--------------

•	Ensure that sqlite dynamic linked library and sqlite tools is downloaded and installed in 

	your system. The files exist for various OS platforms. choose the one for your OS.

	Check the following link: https://www.sqlite.org/download.html unzip the sqlite3.exe

	sqlite3.dll. put the squlite.dll file in the bin folder of where ruby was installed on you system.

	Note that this is very important.








 

