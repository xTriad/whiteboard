class Attendance < ActiveRecord::Base
  attr_accessible :attendance_id, :section_id, :user_id, :class_date, :attendance
  belongs_to :user

  scope :within, lambda { |time_ago| { :conditions => ['class_date > ?', time_ago] } } # within(24.hours.ago)
  scope :in_section, lambda { |section| { :conditions => ['section_id = ?', section] } }
  scope :today, where(:class_date => DateTime.now)

  def self.find_by_user_section_date(user_id, section_id, class_date)
    find(:first,
      :conditions => [
        'user_id = ? AND section_id = ? AND class_date = ?', user_id, section_id, class_date
      ]
    )
  end
end
