@students = []
@cohorts = []
@text_width = 45

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "9. Exit"
end

def show_students
	print_header
	print_student_list
	print_footer
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "9"
			exit # Exit the program - causes it to terminate
		else
			puts "Incorrect selection, please try again!"
		end
end

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def print_s(length)
	length == 1 ? "" : "s"
end

def input_students
	cohort_entry_string = "Please enter the cohort"
	puts "Please enter a name"
	# Create an empty array for students and cohorts
	#students, cohorts = [], []
	# Get the first name
	name = gets.chomp
	# While the name is not empty, repeat this code
	while !name.empty? do
		# Get the cohort
		puts cohort_entry_string
		cohort = gets.chomp
		cohort = "Unknown" if cohort.empty?
		# Add the student name & cohort to the array
		@students << {:name => name, :cohort => cohort}
		# Get another email from the user
		puts "We currently have #{@students.length} student#{print_s(@students.length)}, please enter another or press enter to quit!"
		name = gets.chomp
	end
	#return the array of the sutdents
	@students
end

def print_header
	puts "The student#{print_s(@students.length)} of some cohorts at Makers Academy".center(@text_width)
end

def print_student_list
	@cohorts = @students.map {|student| student[:cohort]}.uniq
	@cohorts.each{|cohort|
		puts "-------------".center(@text_width)
		puts cohort.center(@text_width)
		puts "-------------".center(@text_width)
		i = 1
		@students.select{|student| 
			if student[:cohort] == cohort
				puts "#{i}. #{student[:name]}".center(@text_width)
				i+=1
			end
		}
	}
end

def print_footer
	puts "Overall, we have #{@students.length} great student#{print_s(@students.length)}!".center(@text_width)
end

# call methods
# students = input_students
# print_header(students, @text_width)
# print_student_list(students, @text_width)
# print_footer(students, @text_width)
interactive_menu