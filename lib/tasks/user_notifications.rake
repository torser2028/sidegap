namespace :user_notifications do
  desc 'Query all the Valure users to generate the user notifications'
  task create_valure_notifications: :environment do
    company = Company.find(48)
    company.users.active.each do |user|
      puts "===================================================="
      Institution.all.each do |i|
        puts "Institucion #{i.name} para el usuario #{user.email}"
        notification = UserNotification.new(user: user, institution: i)
        if notification.save
          puts "La notificacion ha sido creada satisfactoriamente"
        else
          puts "Errores: #{notificacion.errors.full_messages}"
        end
      end
      puts "===================================================="
    end
  end
end
