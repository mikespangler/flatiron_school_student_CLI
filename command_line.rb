require_relative './student_class.rb'
require_relative './lab_scraper.rb'

require 'open-uri'
require 'pry'
require 'nokogiri'

class CLIStudent
APPROVED_COMMANDS ||= [:browse, :list, :exit, :show]

attr_reader :on

  def initialize
    # @students_array=students_array
    @on=true
  end


  def call
    # binding.pry
    puts "Hey there. Welcome to our awesome students!"
    puts "Who do you want to scrape today? Please type a first and last name of a student."
    @student_name_input=gets.strip.downcase
    @student_hash_object=StudentScraper.new(@student_name_input) 
    @new_student=@student_hash_object.student_hash.class
    @student_object=Student.new(@new_student)
    puts @student_object
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
 
  # def browse
  #   @student_object.each_with_index do |student, index|
  #     puts "#{index+1}. #{student.student_name}"
  #   end
  # end

  # def show
  #   puts "Please enter a student's first or last name to see their info."
  #   name=gets.strip.downcase
  #     @student_object.each_with_index do |student, index|
  #       if "#{student.name}".downcase.include?(name)
  #     puts "#{index+1}. #{student.student_name}
  #                       #{student.student_blogs}
  #                       #{student.student_social_links}
  #                       #{student.student_bio}
  #     "
  #       end
  #   end
  # end
end

mike=CLIStudent.new
mike.call