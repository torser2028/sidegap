if Rails.env.staging? || Rails.env.production?
  WickedPdf.config = { layout: 'pdf.html' }
else
  WickedPdf.config = { layout: 'pdf.html' }
end
