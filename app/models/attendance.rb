class Attendance < ActiveRecord::Base
  attr_accessible :attendance_id, :section_id, :user_id, :class_date, :attendance
  belongs_to :user

  scope :within, lambda { |time_ago| { :conditions => ['class_date > ?', time_ago] } } # within(24.hours.ago)
  scope :in_section, lambda { |section| { :conditions => ['section_id = ?', section] } }
  # scope :today, where(DateTime.now.at_beginning_of_day.utc..Time.now.utc)
  # scope :red, where(:color => 'red')

  # 1 = present, 2 = absent, 3 = tardy, 4 = excused
  def set_attendance(a)
    attendance = a
  end

end
