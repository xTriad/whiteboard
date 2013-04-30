ActiveAdmin.register User do

  # This overrides the default active admin index method since we only want
  # the current admin user to be able to access things that have the same
  # university_id as him. So, we override the "@users" variable created by
  # active admin to only contain users from the same university. This is
  # done in all of the active admin files.
  controller do
   def index
      index! do |format|
        the_uni_id = AdminUser.find(current_admin_user.id).university_id
        @users = User.where(:university_id => the_uni_id).page(params[:page])
        format.html
      end
    end
  end

  index do
    column :name
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  filter :name
  filter :email

  form do |f|
    the_uni_id = AdminUser.find(current_admin_user.id).university_id

    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :university_id, :as => :hidden, :value => the_uni_id
    end

    f.actions
  end
end
