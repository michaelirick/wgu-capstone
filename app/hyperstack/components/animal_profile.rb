class AnimalProfile < HyperComponent
  param :animal
  param :parent

  render(DIV, class: 'panel panel-default') do
    DIV(class: 'panel-heading') do
      H3 {
        animal.name
      }
    end
    DIV(class: 'panel-body') do
    end
  end
end
