require 'sqlite3'
include SQLite3

class DatabaseFunctions
  def self.create_contact_list(name)
    count = 0
    file_arr = Dir.entries(Dir.pwd)
    file_arr.each do |file|
      if (file == (name + ".db" ))
        puts file
        puts "Database already exists.Please choose another filename"     # checks for filename conflicts 
        count = 1
        break
      end
    end
    if (count == 0)
      my_contacts = Database.new("#{name}.db")
      puts "Your Contacts database has been set up"
      my_contacts.execute "CREATE TABLE IF NOT EXISTS Contacts(
                          FirstName TEXT, 
                          LastName TEXT, 
                          PhoneNumber TEXT )"
    end
    my_contacts
  end

  def self.open_contact_list(name)
    file_arr = Dir.entries(Dir.pwd)
    if !(file_arr.include? (name + ".db" ))
      puts "Contacts database does not exit! Please choose a valid file name"   #ensures a contact database exists before it is opened
    else
      my_contacts = Database.open("#{name}.db")
      puts "Your contacts database is now open!"
      my_contacts.execute "CREATE TABLE IF NOT EXISTS Contacts(
                          FirstName TEXT, 
                          LastName TEXT, 
                          PhoneNumber TEXT )"
    end
    my_contacts
  end

  def self.add_contact(add_command,db_name)
    command = add_command.split(" ")
    length = command.length
    if (length == 6)
      db_name.execute "INSERT INTO Contacts VALUES('#{command[2]}','#{command[3]}','#{command[5]}' )"
    elsif (length == 5)
      db_name.execute "INSERT INTO Contacts VALUES('#{command[2]}','','#{command[4]}' )"
    else
      puts "Enter just first and last name please!"
    end
  end

  def self.search(search_command,db_name)
    begin
      arr = []
      command = search_command.split(" ")
      length = command.length
      if (length == 2) && (command[0] == "search")
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
          puts "which #{command[1]}? choose a number:"
          for i in 0...n
            puts " #{i + 1} #{arr[i][0]} #{arr[i][1]} "
          end
          choice = (gets.chomp.to_i) - 1
          while (choice < 0) || (choice > n-1)
            puts "Enter a valid choice!"
            choice = (gets.chomp.to_i) - 1
          end
          puts "#{arr[choice][0]} #{arr[choice][1]} #{arr[choice][2]}"
          return  arr[choice][2]
        elsif (n == 1)
          puts "#{arr[0][0]} #{arr[0][1]} #{arr[0][2]}"
          return arr[0][2]
        else
           puts "contact does not exist!"
        end
      else
        puts "put the right command "
      end
    ensure
    stream.close if stream
    end
  end
end