namespace :utils do
  desc 'Query the companies and fill the MainEmail and ExtraEmails fields'
  task count_registers: :environment do
    ActiveRecord::Base.send :subclasses
    models_array = ActiveRecord::Base.send(:subclasses).map(&:name).sort
    puts "Total de clases #{models_array.count}"
    models_array.each do |model|
      puts "Registros para #{model} = #{model.constantize.all.count}"
    end
  end

  desc 'Task to fix the institutions table'
  task fix_institutions: :environment do
    institutions = Institution.unscoped.all
    institutions.each do |i|
      File.open("institutions.txt", "a") do |line|
        line.puts "\r Institution.create!(id: #{i.id}, name: '#{i.name}', sector_id: #{i.sector_id}, created_at: '#{i.created_at}', updated_at: '#{i.updated_at}', rule: #{i.rule || false}, executive: #{i.executive || false}, active: #{i.active || false})"
      end
    end
  end

  desc 'Task to fix the rules table'
  task fix_rules: :environment do
    rules = Rule.unscoped.all
    rules.each do |r|
      File.open("rules.txt", "a") do |line|
        line.puts "\r Rule.create!(id: #{r.id}, title: '#{r.title}', number: #{r.number || 0}, kind: '#{r.kind}', filing_at: '#{r.filing_at}', institution_id: #{r.institution_id}, created_at: '#{r.created_at}', updated_at: '#{r.updated_at}', deadline_comments: '#{r.deadline_comments}', for_comments: '#{r.for_comments || ""}')"
      end
    end
  end
end
