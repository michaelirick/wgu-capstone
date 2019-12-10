class AnimalCard < HyperComponent
  param :animal

  render(DIV) do
    animal.name
  end
end