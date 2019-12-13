ActiveAdmin.register Animal do
  permit_params :name, :sex, :sire_id, :dam_id, :breed_id, :profile_image, images: []

  index do
    selectable_column
    id_column
    column :name
    column :breed
    column :sex
    column :sire, class_name: 'Animal'
    column :dam, class_name: 'Animal'
    column :created_at
  end

  filter :name
  filter :sex
  filter :sire, as: :select, collection: Animal.males
  filter :dam, as: :select, collection: Animal.females
  filter :breed
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :sex, as: :select, collection: Animal::SEXES
      f.input :sire, as: :select, collection: Animal.males
      f.input :dam, as: :select, collection: Animal.females
      f.input :breed
      f.input :profile_image, as: :file
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :sire
      row :dam
      row :breed
      row :created_at
      if animal.male?
        row :progeny_by
      else
        row :progeny_from
      end
      row :records
      row :profile_image do |a|
        a.profile_image.attachment.nil? ? '' : image_tag(url_for(a.profile_image))
      end
      row :images do |a|
        a.images.map do |i|
          image_tag url_for(i)
        end
      end
    end
    active_admin_comments
  end
end