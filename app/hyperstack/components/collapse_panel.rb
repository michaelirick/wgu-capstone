class CollapsePanel < HyperComponent
  param :collapse
  param :heading_text
  param :heading_tag

  before_mount do
    @collapse = collapse || true
  end

  def glyphicon
    @collapse ? 'remove' : 'left-arrow'
  end

  render(DIV, class: 'panel panel-default') do
    DIV(class: 'panel-heading') do
      send(heading_tag) do
        SPAN(class: "pull-right glyphicon glyphicon-#{glyphicon}")
        heading_text
      end.on(:click) do
        mutate @collapse = !@collapse
      end
    end
    DIV(class: 'panel-body') do
      @children
    end unless @collapse
  end
end