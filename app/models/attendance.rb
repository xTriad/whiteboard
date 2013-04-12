class Attendance < ActiveRecord::Base
  attr_accessible :attendance_id, :section_id, :user_id, :class_date, :present, :absent, :tardy, :excused
  belongs_to :user

  scope :within, lambda { |time_ago| { :conditions => ['class_date > ?', time_ago] } } # within(24.hours.ago)
  scope :in_section, lambda { |section| { :conditions => ['section_id = ?', section] } }
  # created_at => (DateTime.now.at_beginning_of_day.utc..Time.now.utc)
  # scope :red, where(:color => 'red')

  def self.all_to_json
    all.to_json
  end

  def set_attendance(a)
    if a == "present"
      present = true
      absent = false
      tardy = false
      excused = false
    elsif a == "absent"
      present = false
      absent = true
      tardy = false
      excused = false
    elsif a == "tardy"
      present = false
      absent = false
      tardy = true
      excused = false
    else
      present = false
      absent = false
      tardy = false
      excused = true
    end
  end
end
