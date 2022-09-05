require 'report_builder'
    
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'reports/json/'
    config.report_path = 'reports/report'
  end
  ReportBuilder.build_report
end