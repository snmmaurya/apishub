ActiveAdmin.register Xposition do
  menu parent: "X"

  permit_params :title, :description, :status, :image, :xcategory_id

  includes :xcategory

  filter :title
  filter :status, as: :select, collection: Xcategory.get_status_options(true)

  index do
    selectable_column
    column :title
    column :status
    column :created_at
    actions
  end

  form html: { enctype: "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "X Category" do
      f.input :xcategory_id, as: :select, :collection => Xcategory.options
      f.input :title
      f.input :description
      f.input :image, :as => :file
      f.input :status
    end
    f.actions
  end

  show do |xposition|
    attributes_table do
      row :id
      row :title
      row :description
      row :image do
        if xposition.image.present?
          image_tag(xposition.image.url)
        end
      end
      row :status
      row :created_at
      row :updated_at
    end
  end

end
