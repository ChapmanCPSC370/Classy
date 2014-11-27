class Section < ActiveRecord::Base
  require 'csv'
  
  scope :uniquely_named, group(:section_name)
  
 # validates :course_id, presence: true
  has_many :users
  belongs_to :course
  has_many :announcements
  has_many :assignments
  has_many :enrollments
  has_many :learning_resources, dependent: :destroy
  has_many :reviews
  has_many :degree_requirements, through: :course
  has_many :majors, through: :degree_requirements
  
  def subject_number_section
    if self.subject.presence
      self.subject + " - " + self.section_number + " - " + self.section_section
    end
  end
  
  # Creating majors regex
  # [A-Z]{3,4} ((\d{3}\/\d{3}L)|(\d{3}))
  # WOW
  
  
  
  def self.disperse
    Section.all.each do |f|
      subject_regex = /\A[a-zA-Z]{2,4}/
      number_regex = /(\d{3}[A-Z]{0,1})/ 
      section_regex = /(?<=-)(\d{2})(?=\s)/
      name_regex = /(?<=\s)[a-zA-Z( ) -&]{3,99}/
      start_time_regex = /(0?[1-9]|1[012])(:[0-5]\d)[APap][mM](?=\s)/
      end_time_regex = /(?<=-\s)(0?[1-9]|1[012])(:[0-5]\d)[APap][mM]/
      start_date_regex = /(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/
      end_date_regex = /(?<=-)(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d/
      room_regex = /(?<=Announced|[APap][mM],\s)[a-zA-Z( )\d, &]{3,99}\z/
      days_regex = /(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday|, ){1,7}/
      f.update_attribute(:days_of_class, "farts")
      if (f.section_name_and_title.presence)
        #f.update_attribute(:days_of_class, "farts")
        f.update_attribute(:subject, subject_regex.match(f.section_name_and_title).to_s)
        f.update_attribute(:section_number, number_regex.match(f.section_name_and_title).to_s)
        f.update_attribute(:section_section, section_regex.match(f.section_name_and_title).to_s)
        f.update_attribute(:section_name, name_regex.match(f.section_name_and_title).to_s)
        f.update_attribute(:start_time_s, start_time_regex.match(f.schedule).to_s)
        f.update_attribute(:end_time_s, end_time_regex.match(f.schedule).to_s)
        f.update_attribute(:start_date, Date.strptime(start_date_regex.match(f.schedule).to_s, "%m/%d/%Y"))
        f.update_attribute(:end_date, Date.strptime(end_date_regex.match(f.schedule).to_s, "%m/%d/%Y"))
        f.update_attribute(:room, room_regex.match(f.schedule).to_s)
        f.update_attribute(:days, days_regex.match(f.schedule).to_s)
      end
    end
  end
  
  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|section| [section.section_name_and_title,section.schedule,section.teacher,section.term] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      section_hash = row.to_hash # exclude the price field
      section = Section.where(id: section_hash["id"])

      if section.count == 1
        section.first.update_attributes(section_hash)
      else
        Section.create!(section_hash)
      end # end if !section.nil?
    end # end CSV.foreach
  end # end self.import(file)

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  def average_rating
    ave_rating = 0.0
    num_ratings = 0.0
    reviews.each do |r|
      ave_rating += r.rating
      num_ratings += 1
    end
    if num_ratings == 0
      num_ratings = 1
    end
    return (ave_rating / num_ratings).to_s
  end
  
  def name
    if Course.exists?(course_id)
      return Course.find(course_id).name
    end
  end
  
  def major
    dsdas
  end
  
  def self.search(query)
    where("teacher like ?", "%#{query}%") 
  end
  
end
