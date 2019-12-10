class Catalogue < HyperComponent
  before_mount do
    @selected = nil
    @tab = :about
  end

  def select_animal(animal)
    mutate @selected = animal
    mutate @tab = :profile
  end

  def remove_selected
    mutate @selected = nil
  end

  def search(event)
    puts event.target.value
  end

  def tab_class(tab)
    @tab == tab ? 'active' : ''
  end

  def set_tab(tab)
    mutate @tab = tab
  end

  render(DIV) do
    UL(class: 'nav nav-tabs') do
      {
        about: 'About',
        catalogue: 'Catalogue',
        profile: 'Profile'
      }.each do |k, v|
        LI(role: :presentation, class: tab_class(k)) do
          A {v}
        end.on(:click) do |event|
          set_tab k
        end
      end
    end
    DIV(class: 'tab-content') do
      if @tab == :about
        P { 'About us here' }
      end
      if @tab == :catalogue
        DIV(class: 'form-group') do
          INPUT(class: 'form-control', placeholder: 'Search...').on(:change) do |event|
            search event
          end
        end
        DIV(class: 'catalogue') do
          Animal.all.each do |animal|
            AnimalCard(animal: animal, parent: self)
          end
        end
      end
      if @tab == :profile
        if @selected.nil?
          'No animal selected. Please select one from the Catalogue'
        else
          AnimalProfile(animal: @selected, parent: self)
        end
      end
    end
  end
end
