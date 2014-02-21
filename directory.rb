text_width = 50

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
		# Add the student name & cohort to the array
		students << {:name => name, :cohort => cohort = cohort ||= "Unknown"}
		# Get another email from the user
		puts "We currently have #{students.length} student#{print_s(students.length)}, please enter another or press enter to quit!"
		name = gets.chomp
		if !name.empty?
			puts cohort_entry_string
			cohort = gets.chomp
		end
	end
	#return the array of the sutdents
	students
end

def print_header(students,text_width)
	puts "The student#{print_s(students.length)} of my cohort at Makers Academy".center(text_width)
	puts "-------------".center(text_width)
end

def list(students, text_width)
	students.each_with_index do |student, i|
		puts "#{i+1}. #{student[:name]} (#{student[:cohort]} Cohort)".center(text_width)
	end
end

def print_footer(names, text_width)
	puts "Overall, we have #{names.length} great student#{print_s(names.length)}!".center(text_width)
end

# call methods
students = input_students
print_header(students, text_width)
list(students, text_width)
print_footer(students, text_width)