namespace :stakeholder do
  desc 'Add the stakeholders to a period'
  task set_period: :environment do
    Stakeholder.all.each do |stakeholder|
      puts '======================================================================================='
      puts "Evaluando el congresista #{stakeholder.name} del partido #{stakeholder.political_party}"
      period = Period.first
      StakeholdersPeriod.create!(period: period, stakeholder: stakeholder, political_party: stakeholder.political_party, job: stakeholder.job, commission: stakeholder.commission, region: stakeholder.region)
      puts '======================================================================================='
    end
  end
end
