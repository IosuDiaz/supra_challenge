namespace :influencers do
  desc "Sincronizar influencers desde Modash"
  task sync: :environment do
    InfluencerSyncService.sync_all
    puts "Sincronización completada."
  end
end
