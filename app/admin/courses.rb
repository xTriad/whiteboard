ActiveAdmin.register Course do

  controller do
   def index
      index! do |format|
        the_uni_id = AdminUser.find(current_admin_user.id).university_id
        @courses = Course.where(:university_id => the_uni_id).page(params[:page])
        format.html
      end
    end
  end

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
    the_uni_id = AdminUser.find(current_admin_user.id).university_id

    f.inputs "Course Details" do
      f.input :name
      f.input :number
      f.input :university_id, :as => :hidden, :value => the_uni_id
    end
    f.actions
  end
end
