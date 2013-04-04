class Attendance < ActiveRecord::Base
   attr_accessible :attendance_id, :section_id, :user_id, :class_date, :present, :absent, :tardy, :excused

  # May be easier to just use the Attendance.all.to_json wherever you need it.
  def allToJson
     @allAttenJSON = Attendance.all.to_json
  end
end
