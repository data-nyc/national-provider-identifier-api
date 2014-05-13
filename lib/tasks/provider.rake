namespace :provider do
  namespace :import do
    task monthly: :environment do
      path = "/Users/chad/Desktop/medical_data/NPPES_Data_Dissemination_Apr_2014/npidata_20050523-20140413.csv"
      Provider.import path
    end
  end
end
