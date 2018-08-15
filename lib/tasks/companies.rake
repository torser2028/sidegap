namespace :companies do
  desc 'Query the companies and fill the MainEmail and ExtraEmails fields'
  task update_email_fields: :environment do
    Company.all.each do |company|
      puts "Company ============== #{company.name}"
      emails = ''
      emails = "#{emails}#{company.email_2}" if company.email_2.present?
      emails = "#{emails},#{company.email_3}" if company.email_3.present?
      emails = "#{emails},#{company.email_4}" if company.email_4.present?
      emails = "#{emails},#{company.email_5}" if company.email_5.present?
      puts "#{emails}"
      company.main_email = company.email_1
      company.extra_emails = emails
      if company.save!
        puts 'Company successfully updated'
        puts "Main Email ============== #{company.main_email}"
        puts "Extra Emails ============ #{company.extra_emails}"
      else
        puts "#{company.errors}"
      end
    end
  end
end
