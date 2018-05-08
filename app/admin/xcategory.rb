ActiveAdmin.register Xcategory do
  menu parent: "X"

  permit_params :name, :status, :image

  includes :xpositions

  filter :name
  filter :status, as: :select, collection: Xcategory.get_status_options(true)

  index do
    selectable_column
    column :name
    column :status
    column :created_at
    actions
  end

  form html: { enctype: "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "X Category" do
      f.input :name
      f.input :image, :as => :file
      f.input :status
    end
    f.actions
  end

  show do |xcategory|
    attributes_table do
      row :id
      row :name
      row :image do
        if xcategory.image.present?
          image_tag(xcategory.image.url)
        end
      end
      row :status
      row :created_at
      row :updated_at
    end     
  end

end
