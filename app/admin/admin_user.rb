ActiveAdmin.register AdminUser do

  controller do
   def index
      index! do |format|
        the_uni_id = AdminUser.find(current_admin_user.id).university_id
        @admin_users = AdminUser.where(:university_id => the_uni_id).page(params[:page])
        format.html
      end
    end
  end

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    the_uni_id = AdminUser.find(current_admin_user.id).university_id

    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :university_id, :as => :hidden, :value => the_uni_id
    end

    f.actions
  end
end       
