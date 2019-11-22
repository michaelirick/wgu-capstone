ActiveAdmin.register Record do
  permit_params :title, :animal_id, :record_type, :image

  index do
    selectable_column
    id_column
    column :title
    column :record_type
    column :animal
    column :created_at
  end

  filter :title
  filter :record_type, as: :select, collection: Record::TYPES
  filter :animal
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :record_type, as: :select, collection: Record::TYPES
      f.input :animal
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :record_type
      row :animal
      row :created_at
      row :image do |i|
        image_tag url_for(i.image)
      end
    end
    active_admin_comments
  end
end