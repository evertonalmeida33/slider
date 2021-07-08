Before do
  @page = lambda do |klass|
    klass.new
  end
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')

  if scenario.failed?
    screenshot(scenario_name.downcase!, 'falhou')
  else
    screenshot(scenario_name.downcase!, 'passou')
  end
end

at_exit do
  @infos = {
    'Browser' => Capybara.default_driver.to_s.capitalize,
    'Environment' => ENV['ENV_PREFIX'],
    'Data do Teste' => Time.now.strftime('%d/%B/%Y'),
    'Hora do Teste' => Time.now.strftime('%HH%MM%SS')
  }
  ReportBuilder.configure do |config|
    config.input_path = 'report/report.json'
    config.report_path = 'report/index'
    config.report_types = [:html]
    config.include_images = true
    config.report_title = '[SaudeId] - QA Automação Web - Portal'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end
