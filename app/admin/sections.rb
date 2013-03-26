ActiveAdmin.register Section do
#=begin
  index do                           
    column :course
    column :number     
    column :created_at                
    column :updated_at  
    #column :role_name
    default_actions                   
  end                                 
  
  filter :course
  filter :number
  
  form do |f|                         
    f.inputs "Section Details" do       
      f.input :course
      f.input :number                 
    end                               
    f.actions                         
  end
#=end
end
