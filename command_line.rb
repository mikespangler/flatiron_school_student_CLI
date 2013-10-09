class CLIStudent
APPROVED_COMMANDS = [:browse, :list, :exit, :show]

attr_reader :on

  def initialize(students_array)
    @students_array=students_array
    @on=true
  end


  def call
    puts "Hey there. Welcome to our awesome students!"
    while @on==true
      self.help
    end
  end

  def help
    puts "Please type one of the following: browse, help, exit, or show."
    self.command_request
  end

  def command_request
    self.command(gets.strip.downcase)
  end
 
  def command(input)
    if APPROVED_COMMANDS.include?(input.strip.downcase.to_sym)
      self.send(input)
    else
      puts "invalid command"
    end
  end
 
  def exit
    puts "Goodbye, thanks for browsing our students personal data!"
    @on=false
  end
 
  def browse
    @students_array.each_with_index do |student, index|
      puts "#{index+1}. #{student.student_name}"
    end
  end

  def show
    puts "Please enter a student's first or last name to see their info."
    name=gets.strip.downcase
      @students_array.each_with_index do |student, index|
        if "#{student.name}".downcase.include?(name)
      puts "#{index+1}. #{student.student_name}
                        #{student.student_blogs}
                        #{student.student_social_links}
                        #{student.student_bio}
      "
        end
    end
  end

end