ActiveAdmin.register SectionsUsersRole do

  controller do
   def index
      index! do |format|
        the_uni_id = AdminUser.find(current_admin_user.id).university_id
        user_ids = User.where(:university_id => the_uni_id)
        @sections_users_roles = SectionsUsersRole.where('user_id IN (?)', user_ids).page(params[:page])
        format.html
      end
    end
  end

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
end
