					********CONTACT MANAGER AND SMS APPLICATION********
This application is a console application for managing contacts. It has the follwing functionality:

•A user should be able to add a person on my contacts list with the
 following command: add -n <name> -p <phone number> This command will
 save the contact in an SQLite database

•A user should be able to search for a person's contact by issuing a 
 command: search "Andela" should print the Andela's phone number. In 
 case we have more than one person using the name Andela, it should 
 ask: Which Andela? [1] James [2] Hellen [3] Joshua i.e. James Andela, 
 Hellen Andela, etc.   

•The system should be able to send simple one-way texts to the people 
 in the contacts. e.g. a command text James -m "We meet at Hogwarts, 
 3 PM, Anthony".