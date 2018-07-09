require 'spreadsheet'

namespace :stakeholder do
  desc 'Add the stakeholders to a period'
  task set_period: :environment do
    period = Period.find_by(name: '2014 - 2018')
    Stakeholder.all.each do |stakeholder|
      puts '======================================================================================='
      puts "Evaluando el congresista #{stakeholder.name} del partido #{stakeholder.political_party}"
      period = Period.find_by(name: '2014 - 2018')
      StakeholdersPeriod.create!(period: period, stakeholder: stakeholder, political_party: stakeholder.political_party, job: stakeholder.job, commission: stakeholder.commission, region: stakeholder.region)
      puts '======================================================================================='
    end
  end

  desc 'Read Excel file and create the new stakeholders'
  task import_from_excel: :environment do
    file_name = File.join Rails.root, "lib/tasks/files/2018_2022_stakeholders.xls"
    excel_data = Spreadsheet.open file_name
    sheet = excel_data.worksheet 0
    sheet.each do |item|
      political_party = format_political_party(item[3])
      job = format_job(item[1])
      name = item[2].mb_chars.titleize
      region = format_region(item[4].try(:strip))
      configure_stakeholder(political_party, job, name, region)
    end
  end

  task dedup_stakeholders_period: :environment do
    puts "Initial count ================================ #{StakeholdersPeriod.all.count}"
    ids = StakeholdersPeriod.select("MIN(id) as id").group(:stakeholder_id, :period_id).collect(&:id)
    StakeholdersPeriod.where.not(id: ids).destroy_all
    puts "Final count ================================ #{StakeholdersPeriod.all.count}"
  end

  task fill_missed_fields: :environment do
    StakeholdersPeriod.all.each do |period|
      puts "phone ========================== #{period.phone}"
      puts "stakeholder phone ============== #{period.stakeholder.phone}"
      puts "address ========================== #{period.address}"
      puts "stakeholder address ============== #{period.stakeholder.address}"
      puts "office ========================== #{period.office}"
      puts "stakeholder office ============== #{period.stakeholder.office}"
      period.update_attributes(phone: period.stakeholder.phone, address: period.stakeholder.address, office: period.stakeholder.office)
    end
  end

  def format_political_party(political_party)
    case political_party
    when 'CENTRO DEMOCRATICO'
      'Centro Democratico'
    when 'CAMBIO RADICAL'
      'Cambio Radical'
    when 'PARTIDO CONSERVADOR'
      'Conservador Colombiano'
    when 'PARTIDO LIBERAL'
      'Liberal Colombiano'
    when 'PARTIDO DE LA U'
      'Social de Unidad Nacional "De la U"'
    when 'ALIANZA VERDE'
      'Alianza Verde'
    when 'POLO DEMOCRATICO'
      'Polo Democratico Alternativo'
    when 'PARTIDO FARC'
      p = PoliticalParty.find_or_create_by(name: 'Partido FARC')
      p.name
    when 'LISTA DE LA DECENCIA'
      p = PoliticalParty.find_or_create_by(name: 'Lista de la Decencia')
      p.name
    when 'PARTIDO MIRA', 'MIRA'
      'Movimiento "Mira"'
    when 'SENADO CIRCUNSCRIPCIÓN INDÍGENA - MAIS', 'MAIS'
      'Movimiento Alternativo Indigena y Social "Mais"'
    when 'SENADO CIRCUNSCRIPCIÓN INDÍGENA - AICO'
      'Movimiento Autoridades Indigenas de Colombia "Aico"'
    when 'OPCIÓN CIUDADANA'
      'Opcion Ciudadana'
    when 'COLOMBIA JUSTA LIBRES'
      p = PoliticalParty.find_or_create_by(name: 'Colombia Justa Libres')
      p.name
    when 'COALICIÓN ALTERNATIVA SANTANDEREANA AS'
      p = PoliticalParty.find_or_create_by(name: 'Coalición Alternativa Santandereana "AS"')
      p.name
    end
  end

  def format_job(job)
    case job
    when 'SENADO'
      'Senador de la República'
    when 'CÁMARA'
      'Representante a la Cámara'
    end
  end

  def format_region(region)
    case region
    when 'AMAZONAS'
      'Amazonas'
    when 'ANTIOQUIA'
      'Antioquia'
    when 'ARAUCA'
      'Arauca'
    when 'ATLÁNTICO', 'ATLANTICO'
      'Atlántico'
    when 'BOGOTÁ'
      'Bogotá, D.C.'
    when 'BOLIVAR', 'BOLÍVAR'
      'Bolivar'
    when 'BOYACÁ'
      'Boyacá'
    when 'CALDAS'
      'Caldas'
    when 'CAQUETÁ'
      'Caquetá'
    when 'CASANARE'
      'Casanare'
    when 'CAUCA'
      'Cauca'
    when 'CESÁR'
      'Cesar'
    when 'CHOCÓ'
      'Chocó'
    when 'CONSULADOS'
      'C.E. Exterior'
    when 'CÓRDOBA', 'CÓRODBA'
      'Córdoba'
    when 'CUNDINAMARCA'
      'Cundinamarca'
    when 'GUAINIA'
      'Guanía'
    when 'GUAVIARE'
      'Guaviare'
    when 'HUILA'
      'Huila'
    when 'LA GUAJIRA'
      'La Guajira'
    when 'MAGDALENA'
      'Magdalena'
    when 'META'
      'Meta'
    when 'NARIÑO'
      'Nariño'
    when 'NORTE DE SAN'
      'Norte de Santander'
    when 'PUTUMAYO'
      'Putumayo'
    when 'QUINDÍO', 'QUINDIO'
      'Quindío'
    when 'RISARALDA'
      'Risaralda'
    when 'SANTANDER', 'SATANDER'
      'Santander'
    when 'SAN ANDRÉS'
      'San Andres Islas'
    when 'SUCRE'
      'Sucre'
    when 'TOLIMA'
      'Tolima'
    when 'VALLE'
      'Valle del Cauca'
    when 'VAUPÉS'
      'Vaupés'
    when 'VICHADA'
      r = Region.find_or_create_by(name: 'Vichada')
      r.name
    end
  end

  def configure_stakeholder(political_party, job, name, region)
    puts '======================================================================================='
    stakeholder = Stakeholder.find_by("name like ?", "%#{name}%")
    period = Period.active
    if stakeholder.present?
      puts "El stakeholder existe ========================= #{stakeholder.name}"
    else
      puts "El stakeholder con nombre #{name} no existe y se va a crear"
      stakeholder = Stakeholder.create!(name: name, political_party: political_party, job: job, region: region)
      puts "Se ha creado el stake holder ========================= #{stakeholder.name}"
    end
    stakeholder_period = StakeholdersPeriod.new(period: period, stakeholder: stakeholder, political_party: political_party, job: job, region: region)
    if stakeholder_period.save
      puts "Se creó el stakeholder satisfactoriamente"
    else
      puts "El stakeholder no se ha creado por los siguientes errores: #{stakeholder_period.errors.full_messages}"
    end
    puts '======================================================================================='
  end
end
