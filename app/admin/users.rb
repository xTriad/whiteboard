ActiveAdmin.register User do
  index do                           
    column :name
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count
    column :role_name
    default_actions                   
  end                                 
  
  filter :name
  filter :email

  form do |f|                         
    f.inputs "User Details" do       
      f.input :name
      f.input :email                  
      f.input :password               
      f.input :password_confirmation
    end                               
    f.actions                         
  end       
end