if Rails.env.staging? || Rails.env.production?
  WickedPdf.config = { layout: 'pdf.html', exe_path: '/usr/local/bin/wkhtmltopdf' }
else
  WickedPdf.config = { layout: 'pdf.html', exe_path: '/usr/bin/wkhtmltopdf' }
end