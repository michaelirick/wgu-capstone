ActiveAdmin.register Breed do
  permit_params :name, :parent_id

  index do
    selectable_column
    id_column
    column :name
    column :parent
    column :created_at
  end

  filter :name
  filter :parent
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :parent
    end
    f.actions
  end
end  unless ENV['migrate'] == '1'