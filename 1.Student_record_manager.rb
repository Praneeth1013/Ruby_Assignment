class Students

  def initialize
    @records = {}
  end

  def empty?
    @records.empty?
  end

  def add_student(roll_no, name, grade)
    if @records[roll_no]
      puts "\nStudent exists"
    else
      @records[roll_no] = { name: name, grade: grade }
      puts "\nStudent Added"
    end
  end

  def update_grade(roll_no, grade)
    if @records[roll_no]
      @records[roll_no][:grade] = grade
      puts "Updated roll no #{roll_no} grade to #{grade}"
    else
      puts "Roll number does not exist in records"
    end
  end

  def display_student(roll_no)
    if @records.keys.include?(roll_no)
      puts "\nRoll no\tName\tgrade"
      puts "#{roll_no}\t#{@records[roll_no][:name]}\t#{@records[roll_no][:grade]}"

    else
      puts "Invalid roll number"
    end
  end

  def display_all_students
    puts "Roll no\tName\tgrade"
    @records.each do |k,v|
      puts "#{k}\t#{v[:name]}\t#{v[:grade]}"
    end
  end

  def delete_student(roll_no)
    if @records.keys.include?(roll_no)
      @records.delete(roll_no)
      puts "Deleted successfully"
    else
      puts "Does not exist in records"
    end
  end
end

table1 = Students.new
30.times {print '-'}
puts "\n   Students Records manager\n"
30.times {print '-'}
puts

while true
  print "\n[1] Add a student to the record\n[2] Update the grade of a student\n[3] Display a students data\n[4] Display all students data\n[5] Delete a student from the record\n[6] QUIT\n=>"
  input = gets.chomp
  puts

  case input
  when "1"
    print "ADD STUDENT\nRoll number : "
    roll_no = gets.chomp
    print "Name : "
    name = gets.chomp
    print "Grade : "
    grade = gets.chomp

    table1.add_student(roll_no, name, grade)

  when "2"
    next puts "Table is empty" if table1.empty?

    puts "UPDATE GRADE"
    print "Roll number : "
    roll_no = gets.chomp
    print "New grade : "
    new_grade = gets.chomp

    table1.update_grade(roll_no.strip,new_grade.strip)

  when "3"
    next puts "Table is empty" if table1.empty?

    print "DISPLAY STUDENT\nRoll number : "
    table1.display_student(gets.chomp)

  when "4"
    next puts "Table is empty" if table1.empty?
    table1.display_all_students

  when "5"
    next puts "Table is empty" if table1.empty?

    print "DELETE STUDENT\nRoll number : "
    table1.delete_student(gets.chomp)

  when "6"
    puts "Exiting program"
    break
  else
    puts "ENTER VALID OPTION"
  end
end
