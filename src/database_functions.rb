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
    end
  end
end