# require_relative './command_line.rb'
# require_relative './lab_scraper.rb'

class Student 
	attr_accessor :student_name, :student_social_links, :student_tagline, :student_bio, :student_education, :student_work, :student_coder_cred, :student_links, :student_blogs, :linkedin, :twitter, :github
@@students = [ ] 
		def initialize (student_hash) 
			@student_hash = student_hash
			@@students << self
			# student_name = student_hash.student_name`
			twitter = student_hash.student_social_links[0]
			linkedin = student_hash.student_social_links[1]
			github = student_hash.student_social_links[2]
			# student_tagline = student_hash.student_tagline
			# student_bio = student_hash.student_bio
			# student_education = student_hash.student_education
			# student_work = student_hash.student_work
			# student_coder_cred = student_hash.student_coder_cred
			# student_links = student_hash.student_links
			# student_blogs = student_hash.student_blogs
		end
end 

# s = Student.new(student_hash)


# --take each student and turn it into an object, with a key and value attribute -- push it into an array 