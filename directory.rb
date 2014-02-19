# Input students method
def input_students
	puts "Please enter the names of the students"
	puts "To finish just hit return twice"
	# Create an empty array
	students = []
	# Get the first name
	name = gets.chomp
	# Get the cohort
	if !name.empty?
		puts "Please enter your Cohort"
		cohort = gets.chomp
	end
	# While the name is not empty, repeat this code
	while !name.empty? do
		#add the student hass to the array
		if cohort.empty?
			cohort = "Unknown"
		end
		students << {:name => name.to_sym, :cohort => cohort.to_sym}
		puts "Now we have #{students.length} students!"
		#get another name from the user
		puts "Another name please"
		name = gets.chomp
		# If name is empty, don't ask for cohort!
		if !name.empty?
			puts "And Cohort?"
			cohort = gets.chomp
		end
	end
	#return the array of the sutdents
	students
end

def print_header
	puts "The students of my cohort at Makers Academy"
	"-------------"
end

def print(students)
	students.each_with_index do |student, i|
		puts "#{i+1}. #{student[:name]} (#{student[:cohort]} Cohort)"
	end
end

def print_confirmation(students)
	puts "Please check that all is correct, if it is press enter, else enter the number that is incorrect"
	entry = gets.chomp
	until entry == ""
		index_to_delete = entry.to_i - 1
		students.delete_at(index_to_delete)
		puts "Please re-enter the student's name"
		name = gets.chomp
		puts "Please re-enter the student's cohort"
		cohort = gets.chomp
		students << {:name => name, :cohort => cohort}
		print(students)
		puts "Please check that all is correct, if it is press enter, else press any key then enter"
		entry = gets.chomp
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students!"
end

# call methods
students = input_students
print_header
print(students)
print_confirmation(students)
print_footer(students)