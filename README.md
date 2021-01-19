
## CONTACT MANAGER AND SMS APPLICATION


This application is a console application for managing contacts. It has the following functionality:

1. Creation of a new contact database or access to an existing one 

2. Addition of contacts to the database

3. Ability to search for any contact on the database

4. Ability to send on way SMS to people in the contact list.


The application has an interactive command line interface that forms a relationship with the user 

of the application. Note that the database system used is SQLite database system.
					

### LIST OF VALID COMMANDS IN THE APPLICATION


1. **TO ADD A CONTACT:** add -n [FirstName] [LastNAme] -p [PhoneNumber]. Note that it is not

compulsory to add a last name. Contacts can be added with just one name.

2. **TO SEARCH FOR A CONTACT:** search [name]. If we have more than one search the application lists

all the contacts having the  name irrespective of weather the search keyword is the last name or

first name

3. **TO SEND AN SMS:** text [recipient] -m [message]. The application can only send messages.

4. **TO SEE ALL CONTACTS:** list

5. **TO SEE ALL COMMANDS:** HELP

6. **TO EXIT:** exit 


### INSTRUCTIONS

1. From your command line prompt on your system, install the following Ruby gems(use gem install): 

	* sqlite

	* colorize

2. Ensure that sqlite dynamic linked library and sqlite tools is downloaded and installed in 

your computer. The files exist for various OS platforms. choose the one for your OS.

refer to the  following link: https://www.sqlite.org/download.html Download and  unzip the sqlite3.exe

sqlite3.dll. Put the squlite.dll file in the bin folder of where ruby was installed on your system.

Note that this is very important.



### FUTURE IMPROVEMENTS 
	
1. Implementing a 2 way sms gateway system.

2. Sending bulks sms with the application.

3. Developing an executable file for the application.

4. Storing the contacts in a .txt file.

5. Converting the application to a web application







 

