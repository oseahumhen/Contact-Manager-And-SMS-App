require_relative '../src/class_contacts.rb'
RSpec.describe "contacts and sms app Tests" do
  it "verifies that a new database cant be created with existing file name" do
    my_db = Contacts.create_list("ghost_file_name")
    expect(my_db).to eq false
  end

  it "verifies that no database file is open when the file does not exist" do
    my_db = Contacts.open_list("file_name_does_not_exist")
    expect(my_db).to eq false
  end

  it "verifies add command is used properly" do
    my_db = Contacts.open_list("ghost_file_name")
    result = Contacts.add("add -n ose vera -p 08058813435", 6, my_db)
    expect(result).to eq true
    
  end
  it "verifies add command is used properly" do
    my_db = Contacts.open_list("ghost_file_name")
    result = Contacts.add("add -n ose -p 08058813435", 5,my_db)
    expect(result).to eq true
  end

  it "verifies add command is used properly" do
    my_db = Contacts.open_list("ghost_file_name")
    result = Contacts.add("add 08058813435", 2, my_db)
    expect(result).to eq false
  end

  it "verifies search command does not find an invalid contact" do
    my_db = Contacts.open_list("my_contacts")
    result = Contacts.search("search osawaru", my_db)
    expect(result).to eq false
  end

  it "verifies search command works properly" do
    my_db = Contacts.open_list("my_contacts")
    result = Contacts.search("search oseahumhen", my_db)
    expect(result).to eq "08058813435"
  end

  it "verifies SMS is sent when contact exists" do
    my_db = Contacts.open_list("my_contacts")
    result = Contacts.send_message("text oseahumhen -m i am testing with rspec!", my_db,"ose")
    expect(result).to eq true
  end
end

