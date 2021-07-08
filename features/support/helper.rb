module Helper
  def screenshot(nome_arquivo, resultado)
    caminho_arquivo = "report/screenshots/test_#{resultado}"
    imagem = "#{caminho_arquivo}/#{nome_arquivo}.png"
    page.save_screenshot(imagem)
    attach(imagem, 'image/png')
  end
end
