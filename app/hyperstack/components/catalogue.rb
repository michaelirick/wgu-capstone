class Catalogue < HyperComponent
  before_mount do
    @selected = nil
    @tab = :about
    @animals = []
  end

  after_mount do
    mutate @animals = Animal.all
  end

  def select_animal(animal)
    mutate @selected = animal
    mutate @tab = :profile
  end

  def remove_selected
    mutate @selected = nil
  end

  def tab_class(tab)
    @tab == tab ? 'active' : ''
  end

  def set_tab(tab)
    mutate @tab = tab
  end

  render(DIV, class: '') do
    UL(class: 'nav nav-tabs') do
      {
        about: 'About',
        catalogue: 'Catalogue',
        profile: 'Profile'
      }.each do |k, v|
        LI(role: :presentation, class: "#{tab_class(k)} white-background hyperjunt-tab") do
          A {v}
        end.on(:click) do |event|
          set_tab k
        end
      end
    end
    DIV(class: 'tab-content white-background panel-body') do
      if @tab == :about
        P { 'About us here' }
      end
      if @tab == :catalogue
        DIV(class: 'catalogue') do
          @animals.each do |animal|
            if loading?
              'Loading...'
            else
              AnimalCard(animal: animal, parent: self)
            end
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
