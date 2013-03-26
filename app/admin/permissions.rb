ActiveAdmin.register Permission do
#=begin
  index do                           
    column :name
    column :role
    default_actions                   
  end                                 
  
  filter :name
  filter :role_name

  form do |f|                         
    f.inputs "Permission Details" do       
      f.input :name
      f.input :role_name
    end                               
    f.actions                         
  end
#=end
end
