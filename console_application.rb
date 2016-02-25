#console app not yet complete
require_relative 'src/database_functions.rb'

puts Dir.pwd
while (true)
  puts 'enter your name'
  name = gets.chomp
  db = DatabaseFunctions.open_contact_list(name)

  puts 'your command'
  command = gets.chomp

DatabaseFunctions.search(command,db)
end

#validate the command before sending to add function