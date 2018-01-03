require 'httparty'
require 'pry'

@BASE_URL = "http://json-server.devpointlabs.com/api/v1"

def menu
  puts "--- Menu ---"
  puts "1. All Users"
  puts "2. Single User"
  puts "3. Add User"
  puts "4. Update User"
  puts "5. Delete User"
  puts "6. Quit"
  selection
end  

def selection
  choice = gets.strip.to_i
    if choice == 1
      all_user
    elsif choice == 2
      single_user
    elsif choice == 3
      add_user
    elsif choice == 4  
      update_user
    elsif choice == 5
      delete_user  
    elsif choice == 6
      puts "Exiting Program. Goodbye!"
      exit
    else
      puts "Invalid Choice. Please Enter Valid Selection"
      menu
    end
  menu    
end

def all_user
  users = HTTParty.get("#{@BASE_URL}/users").parsed_response

  users.each do |user|
    puts user['id']
    puts user['first_name']
    puts user['last_name']
    puts user['phone_number']
  end
end

def single_user
  puts "Enter User's ID"
  users = HTTParty.get("#{@BASE_URL}/users/:id").parsed_response
end

def add_user
  puts "Enter First Name"
  puts "Enter Last Name"
  puts "Enter Phone Number"
  users = HTTParty.post("#{@BASE_URL}/users").parsed_response
end

def update_user
end

def delete_user
end

menu


