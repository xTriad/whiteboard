ActiveAdmin.register Role do
  index do                            
    column :name
    column :created_at                
    column :updated_at                
    default_actions                   
  end                                 

  filter :name
  filter :created_at
  filter :updated_at                      

  form do |f|                         
    f.inputs "User Details" do       
      f.input :name
    end                               
    f.actions                         
  end
end
