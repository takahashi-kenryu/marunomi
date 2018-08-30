module Marunomi::CsvImporter
  extend ActiveSupport::Concern

  included do

    def self.import(file)
      ApplicationRecord.transaction do

        destroy_all

        # import
        csv_data = CSV.read(file.path, headers: true)
        if block_given?
          yield(csv_data)
        else
          # insert and update
          csv_data.each do |row|
            row = row.to_hash
            update_record = new

            row.each do |attribute, value|
              update_record[attribute] = value
            end
            update_record.save!
          end
        end
      end
    end

  end
end