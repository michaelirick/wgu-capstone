class Catalogue < HyperComponent
  render(DIV) do
    Animal.all.each do |animal|
      AnimalCard animal: animal
    end
  end
end
