@students = []

def input_students()
    puts "Please enter student credentials as prompted."
    puts "To finish, enter blank credentials."
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
        @students << {name: name, cohort: cohort, cob: cob}
        puts "Now we have #{@students.count} students"
        # get another name and cohort from the user
        puts "Please enter name:"
        name = gets.chomp
        puts "Please enter cohort:"
        cohort = gets.chomp
        puts "Please enter country of birth:"
        cob = gets.chomp
    end
end

def print_header()
    puts "The students of Villains Academy"
    puts  "-------------------------------"
end

def print_students_list()
    puts "All student listing"
    @students.each_with_index { |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) (Country of birth: #{student[:cob]})"
    }
    print "\n"
end

def print_by_cohort()
    puts "Students organised by cohort:"
    students_by_cohort = {}
    # Initialize hash of cohort keys, empty array values
    @students.each { |student| 
        students_by_cohort[student[:cohort]] = []
    }

    # append student details to array value associated with cohort key
    @students.each { |student| 
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

def print_footer()
    puts @students.count != 1 ? "Overall, we have #{@students.count} great students" : "Overall, we have #{@students.count} great student"
end

def print_menu()
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students()
    print_header()
    print_students_list()
    print_footer()
end

def save_students()
    # open file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each { |student|
        student_data = [student[:name], student[:cohort], student[:cob]]
        csv_line = student_data.join(",")
        file.puts csv_line
    } 
    file.close
end

def load_students()
    file = File.open('students.csv', 'r')
    file.readlines.each { |line|
        name, cohort, cob = line.chomp.split(',')
        @students << {name: name, cohort: cohort.to_sym, cob: cob}
    }
    file.close
end

def process(selection)
    case selection
    when "1"
        input_students()
    when "2"
        show_students()
    when "3"
        save_students()
    when "4"
        load_students()
    when "9"
        exit
    else
        puts "I don't know what you mean, try again."
    end
end


def interactive_menu()
    loop do
        print_menu()
        process(gets.chomp)
    end
end


# nothing happens until we call the methods
interactive_menu()