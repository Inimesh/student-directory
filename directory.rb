
def input_students
    puts "Please enter student credentials as prompted."
    puts "To finish, enter blank credentials."
    # create an empty array
    students = []
    # get the first name
    puts "Please enter name:"
    name = gets.chomp

    # User must enter a name
    while name.empty?
        puts "you must enter a student name to begin:"
        name = gets.chomp
    end

    puts "Please enter cohort:"
    cohort = gets.chomp
    puts "Please enter country of birth:"
    cob = gets.chomp
    # while the name is not empty, repeat this code
    until name.empty?
        # add the student hash to the array
        students << {name: name, cohort: cohort, cob: cob}
        puts "Now we have #{students.count} students"
        # get another name and cohort from the user
        puts "Please enter name:"
        name = gets.chomp
        puts "Please enter cohort:"
        cohort = gets.chomp
        puts "Please enter country of birth:"
        cob = gets.chomp
    end
    students 
end

def print_header
    puts "The students of Villains Academy"
    puts  "-------------------------------"
end

def print_n(students)
    puts "All student listing"
    students.each_with_index { |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) (Contry of birth: #{student[:cob]})"
    }
    print "\n"
end

def print_by_cohort(students)
    puts "Students organised by cohort:"
    students_by_cohort = {}
    # Initialize hash of cohort keys, empty array values
    students.each { |student| 
        students_by_cohort[student[:cohort]] = []
    }

    # append student details to array value associated with cohort key
    students.each { |student| 
        students_by_cohort[student[:cohort]] << student
    }

    # Print out of cohort name follwed by related student details
    students_by_cohort.each {|cohort, students|
        puts "#{cohort} cohort:"
        students.each {|student|
            puts "#{student[:name]} (Contry of birth: #{student[:cob]})"
        }
        print "\n"
    }
end

def print_footer(names)
    puts names.count > 1 ? "Overall, we have #{names.count} great students" : "Overall, we have #{names.count} great student"
end

# nothing happens until we call the methods
students = input_students
print_header
print_n(students)
print_by_cohort(students)
print_footer(students)