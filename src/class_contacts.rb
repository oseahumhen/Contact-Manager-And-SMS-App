require 'sqlite3'
require 'colorize'
require 'open-uri'
include SQLite3

class Contacts
  def self.create_list(name)
    count = 0
    file_arr = Dir.entries(Dir.pwd)
    file_arr.each do |file|

      if (file == (name + ".db" ))
        puts file
        puts "Database already exists.Please choose another filename" .red    # checks for filename conflicts 
        count = 1
        return false
      end
    end

    if (count == 0)
      my_contacts = Database.new("#{name}.db")
      puts "Your Contacts database has been set up".green
      my_contacts.execute "CREATE TABLE IF NOT EXISTS Contacts(
                          FirstName TEXT, 
                          LastName TEXT, 
                          PhoneNumber TEXT )"
    end
    my_contacts
  end

  def self.open_list(name)
    file_arr = Dir.entries(Dir.pwd)

    if !(file_arr.include? (name + ".db" ))
      puts "Contacts database does not exit! Please choose a valid file name".red
      return false   #ensures a contact database exists before it is opened
    
    else
      my_contacts = Database.open("#{name}.db")
      puts "Your contacts database is now open!".green
      my_contacts.execute "CREATE TABLE IF NOT EXISTS Contacts(
                          FirstName TEXT, 
                          LastName TEXT, 
                          PhoneNumber TEXT )"
    end
    my_contacts
  end

  def self.add(add_command,length,db_name)
    command = add_command.split(" ")

    if (length == 6)
      db_name.execute "INSERT INTO Contacts VALUES('#{command[2]}','#{command[3]}','#{command[5]}' )"
      puts "contact added!".green
      return true

    elsif (length == 5)
      db_name.execute "INSERT INTO Contacts VALUES('#{command[2]}','','#{command[4]}' )"
      puts "contact added!".green
      return true

    else
      puts "please enter the add command correctly!".red
      return false
    end
  end

  def self.search(search_command,db_name)
    begin
      arr = []
      command = search_command.split(" ")
      stream = db_name.prepare "SELECT * FROM Contacts WHERE FirstName='#{command[1]}'"
      result = stream.execute
      result.each do |row|
        arr << row
      end
      stream = db_name.prepare "SELECT * FROM Contacts WHERE LastName='#{command[1]}'"
      result = stream.execute
      result.each do |row|
        arr << row
      end
      n = arr.length

      if (n > 1)
        puts "which #{command[1]}? choose a number:".yellow
        for i in 0...n
          puts " #{i + 1} #{arr[i][0]} #{arr[i][1]} ".green
        end
        choice = (gets.chomp.to_i) - 1
        while (choice < 0) || (choice > n-1)
          puts "Enter a valid choice!".red
          choice = (gets.chomp.to_i) - 1
        end
        puts "#{arr[choice][0]} #{arr[choice][1]} #{arr[choice][2]}".green
        return  arr[choice][2]

      elsif (n == 1)
        puts "#{arr[0][0]} #{arr[0][1]} #{arr[0][2]}".green
        return arr[0][2]

      else
        puts "contact does not exist!".red
        return false
      end
    ensure
    stream.close if stream
    end
  end

  def self.list(db_name)
    begin
      arr = []
      stream = db_name.prepare "SELECT * FROM Contacts"
      result = stream.execute
      result.each do |row|
        arr << row
      end
      n = arr.length
      puts "\t\tMY CONTACTS".yellow

      for i in 0...n
        printf "%-4s%-12s%-10s%-10s\n".green,(i +1), arr[i][0],arr[i][1],arr[i][2]
      end
    ensure
      stream.close if stream
    end
  end

  def self.send_message(send_command, db_name, user_name )
    command = send_command.split(" ")
    search_command = "search #{command[1]}"
    phone_number = search(search_command, db_name)
    phone_number = phone_number.split("")
    phone_number[0] = "234"
    phone_number = phone_number.join()
    i = 3
    arr = []

    while(command[i] != nil)
      arr << command[i]
      i += 1
    end
    msg = arr.join(" ")
    send_msg = open("http://api.smartsmssolutions.com/smsapi.php?username=oseahumhen&password=osevera&sender=#{user_name}&recipient=#{phone_number}&message=#{msg}")
    
    if (send_msg.status[1] == "OK")
      puts "message sent!".green
      return true
    
    else
      puts "message not sent!".red
      return false
    end
  end

  def self.help
    puts "CONTACT MANAGER COMMAND LIST".yellow
    puts "TO ADD A CONTACT: add -n <FirstName> <LastNAme> -p <PhoneNumber>".green
    puts "TO SEARCH FOR A CONTACT: search <name>".green
    puts "TO SEND AN SMS: text <recipient> -m <message> ".green
    puts "TO SEE ALL CONTACTS: list".green
    puts "TO SEE ALL COMMANDS: help ".green
    puts "TO EXIT: exit".green
  end
end
