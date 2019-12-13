ActiveAdmin.register DashboardMessage do
  permit_params :message, :priority

  index do
    selectable_column
    id_column
    column :message
    column :priority
    column :created_at
  end

  form do |f|
    f.inputs do
      f.input :message, as: :string
      f.input :priority
    end
    f.actions
  end
end