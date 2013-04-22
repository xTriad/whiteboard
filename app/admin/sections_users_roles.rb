ActiveAdmin.register SectionsUsersRole do
#=begin
  index do                           
    column :find_course
    column "Section" do |section|
      link_to section.section.number, admin_section_path(section.section_id)
    end
    column :user
    column :role
    #default_actions                   
  end                                 
  
  filter :find_course
  filter :section
  filter :user
  filter :role
  
  form do |f|                         
    f.inputs "Sections Users Roles Details" do
      f.input :section
      f.input :user
      f.input :role
    end                        
    f.actions
  end
#=end
end
