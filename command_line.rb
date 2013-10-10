require_relative './student_class.rb'
require_relative './lab_scraper.rb'

require 'open-uri'
require 'pry'
require 'nokogiri'

STUDENTS =[
   "Anders Ramsay",
   "Bana Malik",
   "Brendan Manley",
   "Charlotte Chang",
   "Christopher Lee",
   "Daniel Chang",
   "David Bella",
   "Edina Vath",
   "Emily Xie",
   "Greg Eng",
   "Ian Miller",
   "Iris Lee",
   "Ivan Brennan",
   "James Tong",
   "Jeanne Roniger",
   "Joe O'Conor",
   "John Richardson",
   "Joshua Scaglione",
   "Kyle Shike",
   "Logan Hasson",
   "Manuel Neuhauser",
   "Margaret Lee",
   "Matt Campbell",
   "Michael Polycarpou",
   "Mike Spangler",
   "Raymond Gan",
   "Rosanne Hoyem",
   "Sam Yang",
   "Samuel Owens",
   "Saron Yitbarek",
   "Scott Luptowski",
   "Vivian Zhang",
   "Sonja Hall",
   "Stephanie Oh",
   "Theo Vora",
   "Thomas Surgent",
   "Tiffany Peon",
   "Trevor McKendrick",
   "Vinney Cavallo"
   ]

class CLIStudent

APPROVED_COMMANDS ||= [:browse, :exit, :show, :help]

attr_reader :on

  def initialize
    @on=true
  end


  def call
    puts "Hey there. Welcome to our awesome student database!"
    puts "Please type one of the following: browse, help, exit, or show."
    command_request
    while @on == true
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
    puts STUDENTS
  end

  def show
    puts "Who do you want to scrape today? Please type a first and last name of a student."
    @student_name_input = gets.strip.downcase
    begin
    @student_object = StudentScraper.new(@student_name_input)
    system("clear")
    puts "Student Name: #{@student_object.student_name}"
    puts "Tagline: #{@student_object.student_tagline.strip}"
    puts "Bio: #{@student_object.student_bio.strip}"
    puts "Work: #{@student_object.student_work.strip}"
    puts "Education: #{@student_object.student_education.strip}"
    puts "Twitter Link: #{@student_object.student_social_links[0]}"
    puts "LinkedIn Link: #{@student_object.student_social_links[1]}"
    puts "Github Link: #{@student_object.student_social_links[2]}"
    puts "Coder Cred: #{@student_object.student_coder_cred}"
    rescue
      puts "Whoops!  We don't have a student by that name.."
      self.show
    end
  end




end



mike=CLIStudent.new
mike.call