require 'csv'

@students, @cohorts = [], []
@text_width = 45

# Saving/Writing Methods
def ask_for_filename(command)
	puts "Please enter a filename:"
	filename = STDIN.gets.chomp
	case command
	when "Saving"
		if filename.empty?
			puts "No filename given, #{command} to default students.csv"
			filename = "students.csv" 
		end
		save_students(filename)
	when "Loading"
		if !File.exists?(filename)
			if File.exists?("students.csv")
				puts "File: #{filename} doesn't exist, #{command} default students.csv"
				filename = "students.csv" 
			else
				puts "File doesn't exist"
				return
			end
		end
		load_students(filename)
	end
end

def save_students(filename = "students.csv")
	CSV.open(filename,"wb") do |csv|
		@students.each do |student|
			csv << [student[:name], student[:cohort]]
		end
	end
end

# Loading/Reading Methods
def load_students(filename = "students.csv")
	@students = []
	keys = [:name,:cohort]
	CSV.read(filename).map {|row| 
		@students << Hash[keys.zip(row)]
	}
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end

# Interactive Menu
def interactive_menu
	try_load_students
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list"
	puts "4. Load the list"
	puts "9. Exit"
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			ask_for_filename("Saving")
		when "4"
			ask_for_filename("Loading")
		when "9"
			exit
		else
			puts "Incorrect selection, please try again!"
		end
end

# Input Methods
def print_s(length)
	length == 1 ? "" : "s"
end

def add_student(name, cohort)
	@students << {:name => name, :cohort => cohort.to_sym}
end

def input_students
	puts "Please enter a name"
	name = STDIN.gets.chomp
	# While the name is not empty, repeat this code
	while !name.empty? do
		# Get the cohort
		puts "Please enter the cohort"
		cohort = STDIN.gets.chomp
		cohort = "Unknown" if cohort.empty?
		add_student(name,cohort)
		puts "We currently have #{@students.length} student#{print_s(@students.length)}, please enter another or press enter to quit!"
		name = STDIN.gets.chomp
	end
end

# Print Students Methods
def print_separator
	puts "-------------".center(@text_width)
end

def show_students
	print_header
	print_student_list
	print_footer
end

def print_header
	puts "The student#{print_s(@students.length)} of some cohorts at Makers Academy".center(@text_width)
end

def print_student_name(cohort)
	i = 1
	@students.select{|student| 
		if student[:cohort] == cohort
			puts "#{i}. #{student[:name]}".center(@text_width)
			i+=1
		end
	}
end

def print_student_list
	@cohorts = @students.map {|student| student[:cohort]}.uniq
	@cohorts.each{|cohort|
		print_separator
		puts cohort.to_s.center(@text_width)
		print_separator
		print_student_name(cohort)
	}
end

def print_footer
	puts "Overall, we have #{@students.length} great student#{print_s(@students.length)}!".center(@text_width)
end

# call methods
interactive_menu