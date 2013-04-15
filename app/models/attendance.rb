class Attendance < ActiveRecord::Base
  attr_accessible :attendance_id, :section_id, :user_id, :class_date, :attendance
  belongs_to :user

  scope :within, lambda { |time_ago| { :conditions => ['class_date > ?', time_ago] } } # within(24.hours.ago)
  scope :in_section, lambda { |section| { :conditions => ['section_id = ?', section] } }
  # scope :today, where(DateTime.now.at_beginning_of_day.utc..Time.now.utc)
  # scope :red, where(:color => 'red')

  def set_attendance(a)
    if a == "present"
      attendance = Constants::Attendance::Present
    elsif a == "absent"
      attendance = Constants::Attendance::Absent
    elsif a == "tardy"
      attendance = Constants::Attendance::Tardy
    else # "excused"
      attendance = Constants::Attendance::Excused
    end
  end

end
