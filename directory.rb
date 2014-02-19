# All the students within an array
students = [
	{:name => "Mario Gintili", 		:cohort => :February},
	{:name => "Mikhail Dubov", 		:cohort => :February},
	{:name => "Karolis Noreika", 	:cohort => :February},
	{:name => "Michael Sidon", 		:cohort => :February},
	{:name => "Charles De Barros",	:cohort => :February},
	{:name => "Ruslan Vikhor", 		:cohort => :February},
	{:name => "Toby Retallick", 	:cohort => :February},
	{:name => "Mark Mekhaiel", 		:cohort => :February},
	{:name => "Sarah Young", 		:cohort => :February},
	{:name => "Hannah Wight", 		:cohort => :February},
	{:name => "Khushkaran Singh", 	:cohort => :February},
	{:name => "Rick brunstedt", 	:cohort => :February},
	{:name => "Manjit Singh", 		:cohort => :February},
	{:name => "Alex Gaudiosi", 		:cohort => :February},
	{:name => "Ross Hepburn", 		:cohort => :February},
	{:name => "Natascia Marchese", 	:cohort => :February},
	{:name => "Tiffanie Chia", 		:cohort => :February},
	{:name => "Matthew Thomas", 	:cohort => :February},
	{:name => "Freddy McGroarty", 	:cohort => :February},
	{:name => "Tyler Rollins", 		:cohort => :February},
	{:name => "Richard Curteis", 	:cohort => :February},
	{:name => "Anna Yanova", 		:cohort => :February},
	{:name => "Andrew Cumine", 		:cohort => :February}
]

def print_header
	print "The students of my cohort at Makers Academy\n"
	print "-------------\n"
end

def list(students)
	students.each_with_index do |student, i|
		if student[:name].chr.downcase == "a"
			if student[:name].length < 12
				print "#{i+1}. #{student[:name]} (#{student[:cohort]} Cohort)\n"
			end
		end
	end
end

def print_footer(names)
	print "Overall, we have #{names.length} great students!\n"
end

# call methods
print_header
list(students)
print_footer(students)