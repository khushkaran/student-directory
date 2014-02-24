text_width = 45

def print_s(length)
	length == 1 ? "" : "s"
end

def input_students
	cohort_entry_string = "Please enter the cohort"
	puts "Please enter a name"
	# Create an empty array for students and cohorts
	students, cohorts = [], []
	# Get the first name
	name = gets.chomp
	# While the name is not empty, repeat this code
	while !name.empty? do
		# Get the cohort
		puts cohort_entry_string
		cohort = gets.chomp
		cohort = "Unknown" if cohort.empty?
		# Add the student name & cohort to the array
		students << {:name => name, :cohort => cohort}
		# Get another email from the user
		puts "We currently have #{students.length} student#{print_s(students.length)}, please enter another or press enter to quit!"
		name = gets.chomp
	end
	#return the array of the sutdents
	students
end

def print_header(students,text_width)
	puts "The student#{print_s(students.length)} of some cohorts at Makers Academy".center(text_width)
end

def list(students, text_width)
	cohorts = students.map {|student| student[:cohort]}.uniq
	cohorts.each{|cohort|
		puts "-------------".center(text_width)
		puts cohort.center(text_width)
		puts "-------------".center(text_width)
		i = 1
		students.select{|student| 
			if student[:cohort] == cohort
				puts "#{i}. #{student[:name]}".center(text_width)
				i+=1
			end
		}
	}
end

def print_footer(names, text_width)
	puts "Overall, we have #{names.length} great student#{print_s(names.length)}!".center(text_width)
end

# call methods
students = input_students
print_header(students, text_width)
list(students, text_width)
print_footer(students, text_width)