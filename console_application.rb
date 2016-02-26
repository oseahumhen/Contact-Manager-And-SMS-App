require 'colorize'
require_relative 'src/database_functions.rb'
puts "                    Welcome to Contacts Manager".yellow
puts "                ************************************".green
puts "                ************************************".green
puts "                ************************************".green
puts "Welcome to Contacts Manager. I am your assistant. May I know your name?".yellow
user_name = gets.chomp
puts "Welcome #{user_name}!Do you have a contacts list set up? (Y OR N)".yellow
answer = gets.chomp
count = 0
check = false
  while(count == 0) || (check == false)
    if(answer.downcase == "y")
      puts"What is the name of your contact file".yellow
      name = gets.chomp
      db = DatabaseFunctions.open_contact_list(name)
      check = db
      count += 1
    elsif(answer.downcase == "n")
      puts "I will create one for your. What do you want to call it.".yellow
      name = gets.chomp
      db = DatabaseFunctions.create_contact_list(name)
      check = db
      count += 1
    else
      puts"valid respose is Y or N".red
      puts"your response again please:".yellow
      answer = gets.chomp
    end
  end
  DatabaseFunctions.help
  while true
    puts "type a command:"
    init_command = gets.chomp
    command = init_command.split(" ")
    length = command.length
    if(command[0] == "exit")
      puts "Goodbye #{user_name}. I hope to see you soon!".yellow
      break
    elsif(command[0] == "add")
      DatabaseFunctions.add_contact(init_command,length,db)
    elsif(length == 2) && (command[0] == "search")
      DatabaseFunctions.search(init_command, db)
    elsif(length == 4) && (command[0] == "text") && (command[2] == "-m") 
      DatabaseFunctions.send_message(init_command,db,user_name)
    elsif(command[0] == "list") && (length == 1) 
      DatabaseFunctions.list(db)
    elsif(command[0] == "help") && (length == 1)
      DatabaseFunctions.help
    else
      puts"Invalid command. please type help to see valid commands".red
    end
  end