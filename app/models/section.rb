class Section < ActiveRecord::Base
  require 'csv'
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
  
  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|section| [section.name,section.year,section.trim,section.make_id] }
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
