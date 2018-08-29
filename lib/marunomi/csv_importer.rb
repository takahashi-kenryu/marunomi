module Marunomi::CsvImporter
  extend ActiveSupport::Concern

  SAFIX_CODE = '_code'
  SAFIX_ID   = '_id'

  included do

    scope :selectable, -> {where(selectable: true)}

    def self.import(file)
      ApplicationRecord.transaction do
        # flag unselectable
        all.update_all selectable: false

        # import
        csv_data = CSV.read(file.path, headers: true)
        if block_given?
          yield(csv_data)
        else
          # insert and update
          csv_data.each do |row|
            row = row.to_hash

            code_attribute_name = name.underscore + SAFIX_CODE
            csv_code_value = row[code_attribute_name]
            update_record = find_by(code_attribute_name => csv_code_value)
            update_record ||= new

            row.each do |attribute, value|
              if attribute.include? SAFIX_CODE
                # xxx_code to xxx_id
                model_name_index = attribute.index(SAFIX_CODE)
                model_name = attribute[0, model_name_index]
                if model_name != name.underscore
                  model = model_name.classify.constantize
                  value = model.find_by(attribute => value).id
                  attribute = model_name + SAFIX_ID
                end
              end
              update_record[attribute] = value
            end
            update_record.selectable = true
            update_record.save!
          end
        end
      end
    end

  end
end