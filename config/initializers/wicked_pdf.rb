if Rails.env.staging? || Rails.env.production?
  WickedPdf.config = { layout: 'pdf.html', exe_path: Rails.root.join('bin', 'wkhtmltopdf').to_s }
else
  WickedPdf.config = { layout: 'pdf.html', exe_path: '/usr/bin/wkhtmltopdf' }
end