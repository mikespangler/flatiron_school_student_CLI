# require_relative './command_line.rb'
# require_relative './student_class.rb'

require 'open-uri'
require 'nokogiri'

class StudentScraper
  attr_accessor :student_profile, :student_name, :student_url, :student_hash, :github

  def initialize(student_name)
    @student_name = student_name.downcase.strip
    self.scrape_url
 
      @student_profile = Nokogiri::HTML(open(@student_url)) 

    self.call
      
  end

  def scrape_url
    flatiron_page = Nokogiri::HTML(open("http://students.flatironschool.com"))
    flatiron_page.css("div.big-comment").each do |student|
      if student.css("h3").text.downcase.include? (@student_name)
       @student_url = "http://students.flatironschool.com/" + student.css("a").attribute("href").value
     end
    end
  end


  def call
    @student_hash={}
    student_name; student_hash[:name]= @student_name
    student_social_links; student_hash[:social_links]
    # student_social_links; student_hash[:social_links]<< @twitter
    # student_social_links; student_hash[:social_links][1]= @linkedin
    # student_social_links; student_hash[:social_links][2]= @github

    student_tagline; student_hash[:tagline]= @student_tagline
    student_bio; student_hash[:bio]= @student_bio
    student_education; student_hash[:education]= @student_education
    student_work; student_hash[:work]= @student_work
    student_coder_cred; student_hash[:student_coder_cred]= @student_coder_cred
    student_links; student_hash[:links]= @student_links
    @student_hash
  end

  def student_name
    @student_name = @student_profile.css("h4.ib_main_header").text
  end

  def student_social_links
    @student_social_links = student_profile.css("div.social-icons a").collect do |social|
      social.attribute("href").value
    end
  end

  def student_tagline
    @student_tagline=student_profile.css("div.quote-div h3").text
  end

  def student_bio
    @student_bio=student_profile.css("div.services p").first.text
  end 
  
  def student_education
    @student_education=student_profile.css("div.services ul li").text
  end 

  def student_work
    @student_work = student_profile.css("div.services p")[1].text
  end

  def student_coder_cred
    @student_coder_cred = student_profile.css("div.column.fourth a").collect do |link| link.attribute("href").value
    end
  end

  def student_links
    @student_links=student_profile.css("div.services p a").collect do |link|
      link.attribute("href").value if link.attribute("href") != nil
      end
    @student_links = @student_links.compact! - @student_coder_cred
  end

  def student_blogs
    @student_blogs=[]
    student_profile.css("div.services").collect do |tag|
      if tag.css("h3").text == "Blogs"
        tag.css("p a").each do |link|
         @student_blogs << link.attribute("href").value  if link!= nil
        end
      end
    end
  end

end

# mike = StudentScraper.new("http://students.flatironschool.com/students/mike_spangler.html")
# mike.call


# student scraper creates an array 


  # student_profile = Nokogiri::HTML(open("http://students.flatironschool.com/students/mike_spangler.html"))



# student_social_links = student_profile.css("div.social-icons a").collect do |social|
#     social.attribute("href").value
#   end

# student_tagline = student_profile.css("div.quote-div h3").text

# student_bio = student_profile.css("div.services p").first.text

# student_education = student_profile.css("div.services ul li").text

# student_work = student_profile.css("div.services p")[1].text

# student_coder_cred = student_profile.css("div.column.fourth a").collect do |link|
#   link.attribute("href").value
# end

# student_links = student_profile.css("div.services p a").collect do |link|
#     link.attribute("href").value if link.attribute("href") != nil
#   end

# student_links = student_links.compact! - student_coder_cred


#   blog_tags =[]
#   student_profile.css("div.services").collect do |tag|
#       if tag.css("h3").text == "Blogs"
#         tag.css("p a").each do |link|
#          blog_tags << link.attribute("href").value  if link!= nil
#         end
#       end
#   end


# end



#         # link.attribute("href").value if link.attribute("href") != nil


#         # tag.css("p a").each do |link|
#         # link.attribute("href").value if link.attribute("href") != nil



# # student_link = student_profile.css("div.services").collect do |section|
# #     section.css("div.services-title h3").text
# #     section.css("p a").each do |link|
# #         link.attribute("href").value if link.attribute("href") != nil
# #     end
# #   end




