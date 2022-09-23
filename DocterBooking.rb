#Method for email validation
def check_email?(email)
    (email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,3})\Z/i)
end

#Method for slot booking
def slotbook(time)
  $k = 1
  while $k > 0
    if Array.include? time
      puts "slot are alredy booked enter another time"
      time = gets.chomp.to_i
      next
    else
      booked_time = time  
      $k=0
    end
  end
  return booked_time
end

puts"***Welcome to doctor booking application***"
puts"Docter available only 10 to 5"
puts"--------------------------------------------"


var2 =[]
Array = []
$x= 1

while $x > 0 
    patientinfo = Hash.new
  puts "For enter the patient details press 1"
  puts "For cheacking the patient details press 2"
  puts "For exit press 3\n"
  num = gets.chomp.to_i
  case num
  when 1
    y= 1
    
    while y > 0 
      patientinfo = Hash.new
      puts "\nPlease enter patient details here\n"
      print "Enter name: "
      patientinfo["Name"]= gets.chomp
      print "Enter age: "
      patientinfo["Age"] = gets.chomp.to_i
      print "Enter diseases : "
      patientinfo["Diseases"]= gets.chomp
      print "Enter email: "
      @valid_email = gets.chomp
      if check_email?(@valid_email)
        patientinfo["Email"]= @valid_email
      else
          puts"!!!enter a valid email like abc123@gmail.com\n"
          patientinfo["Email"]= gets.chomp
      end
      puts"Enter your appointment time\n";
      time = gets.chomp.to_i
      sloat_time = slotbook(time)
      patientinfo["Slot"]=sloat_time
      Array << patientinfo["Slot"]
      #append patient information into an array
      var2 << patientinfo
      puts "Do you want to add another details???\nIf yes press 1 \nIf no press 0"
      y = gets.chomp.to_i
    end
    puts"*************************************\n"
  when 2
    puts"\nHere is the details of patient\n"
    if patientinfo.empty?()
      puts"the list is empty please enter details of patient\n"
    end
    puts var2
    puts"****************************************\n"  
  when 3
    $x=0
  else
    puts "invalid choice"
    puts"******************************\n"
  end
#end of case
end 
#end of while
