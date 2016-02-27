
<a href="https://codeclimate.com/repos/56cfb20278a2e5008500347f/feed"><img src="https://codeclimate.com/repos/56cfb20278a2e5008500347f/badges/e531666b51edf2494ca9/gpa.svg" /></a>
										
##CONTACT MANAGER AND SMS APPLICATION


This application is a console application for managing contacts. It has the following functionality:

*Creation of a new contact database or access to an existing one 

*Addition of contacts to the database

*Ability to search for any contact on the database

*Ability to send on way SMS to people in the contact list.


The application has an interactive command line interface that forms a relationship with the user 

of the application. Note that the database system used is SQLite database system.
					

###LIST OF VALID COMMANDS IN THE APPLICATION


*TO ADD A CONTACT: add -n [FirstName] [LastNAme] -p [PhoneNumber]. Note that it is not

compulsory to add a last name. Contacts can be added with just one name.

*TO SEARCH FOR A CONTACT: search [name]. If we have more than one search the application lists

all the contacts having the  name irrespective of weather the search keyword is the last name or

first name

*TO SEND AN SMS: text [recipient] -m [message]. The application can only send messages.

*TO SEE ALL CONTACTS: list

*TO SEE ALL COMMANDS: HELP

*TO EXIT: exit 


###INSTRUCTIONS

*From your command line prompt on your system, install the following Ruby gems(use gem install): 

	*sqlite

	*colorize

*Ensure that sqlite dynamic linked library and sqlite tools is downloaded and installed in 

your computer. The files exist for various OS platforms. choose the one for your OS.

refer to the  following link: https://www.sqlite.org/download.html Download and  unzip the sqlite3.exe

sqlite3.dll. Put the squlite.dll file in the bin folder of where ruby was installed on your system.

Note that this is very important.



###FUTURE IMPROVEMENTS 

	
*Implementing a 2 way sms gateway system

*sending bulks sms with the application

*developing an executable file for the application

*storing the contacts in a .txt file

*converting the application to a web application







 

