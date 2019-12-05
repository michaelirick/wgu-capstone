class AnimalCard < HyperComponent
  param :animal
  param :parent

  render(DIV, class: 'animal-card panel panel-default') do
    DIV(class: 'panel-heading') {
      H3 { animal.name }.on(:click) do |event|
        parent.select_animal animal
      end
    }
    DIV(class: 'panel-body') {
      IMG(class: 'pull-right', src: animal.profile_image_file)
      TABLE do
        TBODY do
          TR do
            TD { 'Sex:' }
            TD { animal.sex }
          end
          TR do
            TD { 'Breed:' }
            TD { animal.breed.name }
          end
          TR do
            TD { 'Sire:' }
            TD(class: 'btn-link') { animal.sire.name }.on(:click) do |event|
              parent.select_animal animal.sire
            end
          end if animal.sire.present?
          TR do
            TD { 'Dam:' }
            TD(class: 'btn-link') { animal.dam.name }.on(:click) do |event|
              parent.select_animal animal.dam
            end
          end if animal.dam.present?
        end
      end
    }
  end
end