WickedPdf.config do |variable|
  config.layout = 'pdf.html'

  if Rails.env.staging? || Rails.env.production?
    config.exe_path = Rails.root.join('bin', 'wkhtmltopdf').to_s
  else
    config.exe_path = '/usr/bin/wkhtmltopdf'
  end
end