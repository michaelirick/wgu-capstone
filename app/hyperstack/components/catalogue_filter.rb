class CatalogueFilter < HyperComponent
  param :parent

  before_mount do
    @name = ''
    @sexes = []
    @breeds = []
  end

  def search!
    data = {}
    data[:name] = @name unless @name.empty?
    data[:sexes] = @sexes unless @sexes.empty?
    data[:breeds] = @breeds unless @breeds.empty?
    parent.search data
  end

  def search_name(event)
    mutate @name = event.target.value
    search!
  end

  def search_breed(event)
    mutate @breeds = event.target.value
    search!
  end

  def search_sex(event)
    mutate @breeds = event.target.value
    search!
  end

  render(DIV) do
    DIV(class: 'form-group') do
      LABEL { 'Name' }
      INPUT(class: 'form-control', placeholder: 'Search...').on(:change) do |event|
        search_name event
      end
    end
    DIV(class: 'form-group') do
      LABEL { 'Breed' }
      SELECT(class: 'form-control', multiple: true, placeholder: 'Breed...') do
        Breed.all.each do |breed|
          OPTION(
            value: breed.id,
            selected: (@breeds.include?(breed.id))
          ) { breed.name }
        end
      end.on(:change) { |event| search_breed event }
    end
    DIV(class: 'form-group') do
      LABEL { 'Sex' }
      SELECT(class: 'form-control', multiple: true, placeholder: 'Sex...') do
        OPTION(value: :male) { 'Male' }
        OPTION(value: :female) { 'Female' }
      end.on(:change) { |event| search_sex event }
    end
  end
end