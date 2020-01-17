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
end
