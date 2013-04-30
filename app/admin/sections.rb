ActiveAdmin.register Section do

  controller do
    def index
      index! do |format|
        the_uni_id = AdminUser.find(current_admin_user.id).university_id
        uni_courses = Course.where(:university_id => the_uni_id)
        @sections = Section.where('course_id IN (?)', uni_courses).page(params[:page])
        format.html
      end
    end

    def filter
      filter! do |name|
        the_uni_id = AdminUser.find(current_admin_user.id).university_id
        @courses = Course.where(:university_id => the_uni_id).page(params[:page])
      end
    end

    # def form f
    #   form! do |f|
    #     the_uni_id = AdminUser.find(current_admin_user.id).university_id
    #     @course_sections = Course.where(:university_id => the_uni_id).page(params[:page])
    #     # @sections = Section.where('course_id IN (?)', uni_courses).page(params[:page])
    #   end
    # end
  end

  index do
    column :course
    column :number
    column :created_at
    column :updated_at
    default_actions
  end
  
  filter :course
  filter :number
  
  form do |f|
    the_uni_id = AdminUser.find(current_admin_user.id).university_id

    f.inputs "Section Details" do
      f.input :course
      f.input :number
      f.input :university_id, :as => :hidden, :value => the_uni_id
    end

    f.actions
  end
end
