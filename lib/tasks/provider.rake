namespace :provider do
  namespace :import do
    task monthly: :environment do
      DataSource.next.import
    end
  end
end
