# require_relative './command_line.rb'
# require_relative './lab_scraper.rb'

class Student 
	attr_accessor :name, :student_social_links, :student_tagline, :student_bio, :student_education, :student_work, :student_coder_cred, :student_links, :student_blogs 

@@students = [ ] 

		def initialize (student_hash) 
			@@students << self
			self.name = student_hash[:name]
			self.student_social_links = student_hash[:student_social_links]
			self.student_tagline = student_hash[:student_tagline]
			self.student_bio = student_hash[:student_bio]
			self.student_education = student_hash[:student_education]
			self.student_work = student_hash[:student_work]
			self.student_coder_cred = student_hash[:student_coder_cred]
			self.student_links = student_hash[:student_links]
			self.student_blogs = student_hash[:student_blogs]
		end

end 

# s = Student.new(student_hash)


# --take each student and turn it into an object, with a key and value attribute -- push it into an array 