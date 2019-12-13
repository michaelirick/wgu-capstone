class Panel < HyperComponent
  param :heading_text
  param :heading_tag

  render(DIV, class: 'panel panel-default') do
    DIV(class: 'panel-heading') do
      send(heading_tag) do
        heading_text
      end
    end
    DIV(class: 'panel-body') do
      children.render
    end
  end
end