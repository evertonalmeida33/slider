require_relative "base_page"

class Busca < BasePage
  attr_reader :busca, :ordenar, :filtroHospital, :resultadoBusca, :dropdownItemBusca

  def initialize
    @busca = EL['busca']
    @ordenar = EL['ordenar']
    @filtroHospital = EL['filtroHospital']
    @resultadoBusca = EL['resultadoBusca']
    @dropdownItemBusca = EL['dropdownItemBusca']
  end

  def go
    visit '/'
  end

  def realizar_busca(nomeCirurgia)
    find(busca).set nomeCirurgia
    find(dropdownItemBusca, text: nomeCirurgia).click
  end

  def resultado_busca
    all(resultadoBusca)[0].text
  end

  def filtrar_por_valor(min, max)
    # valueNow = 0 

    slider = find('span[class*=MuiSlider-root] > span:nth-child(4)')

    action = new Actions(driver);					
		
    action.dragAndDrop(slider, 500).perform();
    
    # element = find('span[class*=MuiSlider-root] > span:nth-child(4)')
    # element.touch_action(:flick, axis: 'x', distance: 50,  duration: 50)

    # while valueNow.to_i < min.to_i do
    #   puts valueNow
    #   element.touch_action(:move, path: {xdist: 0.5, ydist: -50}, duration: 500)
    #   valueNow = find('span[class*=MuiSlider-root] > span:nth-child(4)')[:'aria-valuenow']
    #   puts valueNow
    # end


    # valueMax = find('span[class*=MuiSlider-root] > span:nth-child(5)')[:'aria-valuemax']
    # percent = min.to_i * 100 / valueMax.to_i

    # element.touch_action(:move, path: {xdist: percent, ydist: -50}, duration: 500)
  
    
  end

  def filtrar_por_hospital(nomeHospital)
    find('div[data-testid="accordion"] div span', text: 'Por hospital').click
    find('.styles__Wrapper-sc-12d355g-0', text: nomeHospital).click
  end

end

