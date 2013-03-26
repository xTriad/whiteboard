ActiveAdmin.register Course do
#=begin
  index do                           
    column :number
    column :name
    column :created_at
    column :updated_at
    default_actions                   
  end                                 
  
  filter :name
  filter :number

  form do |f|                         
    f.inputs "Course Details" do       
      f.input :name
      f.input :number
    end                               
    f.actions                         
  end
#=end
end
