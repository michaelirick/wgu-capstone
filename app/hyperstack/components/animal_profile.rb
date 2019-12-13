class AnimalProfile < HyperComponent
  param :animal
  param :parent

  before_mount do
    @collapse = false
  end

  render(DIV, class: 'panel panel-default') do
    DIV(class: 'panel-heading') do
      H3 {
        animal.name
      }
    end
    DIV(class: 'panel-body') do
      IMG(src: animal.profile_image_file)
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
      CollapsePanel(collapse: true, heading_text: 'Images', heading_tag: :H4) do
        DIV(class: :catalogue) do
          animal.image_files.each do |image|
            IMG(src: image)
          end
        end
      end unless animal.image_files.empty?

      CollapsePanel(collapse: true, heading_text: 'Records', heading_tag: :H4) do
        DIV(class: :catalogue) do
          animal.records.each do |record|
            Panel(heading_tag: :H5, heading_text: "[#{record.record_type}] #{record.title}") do
              IMG(src: record.image_file)
            end
          end
        end
      end unless animal.records.empty?

      progeny = animal.male? ? animal.progeny_by : animal.progeny_from
      CollapsePanel(collapse: true, heading_text: 'Progeny', heading_tag: :H4) do
        DIV(class: 'catalogue') do
          progeny.each do |child|
            AnimalCard(animal: child, parent: parent)
          end
        end
      end unless progeny.empty?
    end
  end
end
