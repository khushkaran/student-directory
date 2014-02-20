# All the students within an array
students = [
	{:name => "Mario Gintili", 		:cohort => :February, :hobby => "Football",		:cob => "UK"},
	{:name => "Mikhail Dubov", 		:cohort => :February, :hobby => "Formula 1",	:cob => "UK"},
	{:name => "Karolis Noreika", 	:cohort => :February, :hobby => "Coding",		:cob => "UK"},
	{:name => "Michael Sidon", 		:cohort => :February, :hobby => "Football",		:cob => "UK"},
	{:name => "Charles De Barros",	:cohort => :February, :hobby => "Football",		:cob => "Belgium"},
	{:name => "Ruslan Vikhor", 		:cohort => :February, :hobby => "Running",		:cob => "UK"},
	{:name => "Toby Retallick", 	:cohort => :February, :hobby => "Football",		:cob => "New Zealand"},
	{:name => "Mark Mekhaiel", 		:cohort => :February, :hobby => "Football",		:cob => "UK"},
	{:name => "Sarah Young", 		:cohort => :February, :hobby => "Running",		:cob => "USA"},
	{:name => "Hannah Wight", 		:cohort => :February, :hobby => "Football",		:cob => "UK"},
	{:name => "Khushkaran Singh", 	:cohort => :February, :hobby => "Formula 1",	:cob => "UK"},
	{:name => "Rick brunstedt", 	:cohort => :February, :hobby => "Football",		:cob => "UK"},
	{:name => "Manjit Singh", 		:cohort => :February, :hobby => "Cricket",		:cob => "UK"},
	{:name => "Alex Gaudiosi", 		:cohort => :February, :hobby => "Football",		:cob => "Germany"},
	{:name => "Ross Hepburn", 		:cohort => :February, :hobby => "Football",		:cob => "UK"},
	{:name => "Natascia Marchese", 	:cohort => :February, :hobby => "Formula 1",	:cob => "UK"},
	{:name => "Tiffanie Chia", 		:cohort => :February, :hobby => "Football",		:cob => "Singapore"},
	{:name => "Matthew Thomas", 	:cohort => :February, :hobby => "Football",		:cob => "USA"},
	{:name => "Freddy McGroarty", 	:cohort => :February, :hobby => "Rugby",		:cob => "UK"},
	{:name => "Tyler Rollins", 		:cohort => :February, :hobby => "Football",		:cob => "UK"},
	{:name => "Richard Curteis", 	:cohort => :February, :hobby => "Walking",		:cob => "UK"},
	{:name => "Anna Yanova", 		:cohort => :February, :hobby => "Lifting",		:cob => "UK"},
	{:name => "Andrew Cumine", 		:cohort => :February, :hobby => "Football",		:cob => "UK"}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------"
end

def list(students)
	i = 0
	while i < students.length
		puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} Cohort) || Hobby: #{students[i][:hobby]} || Country of Birth: #{students[i][:cob]}"
		i += 1
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students!\n"
end

# call methods
print_header
list(students)
print_footer(students)