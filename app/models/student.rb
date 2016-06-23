require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
self.attribute_names =  [:id, :first_name, :last_name, :age, :email, :phone, :created_at, :updated_at]
attr_reader :attributes, :old_attributes

	def initialize(attributes = {})
    attributes.symbolize_keys!
	raise_error_if_invalid_attribute!(attributes.keys)
	# This defines the value even if it's not present in attributes
    @attributes = {}

    Student.attribute_names.each do |name|
      @attributes[name] = attributes[name]
    end

    Student.attribute_age.each do |age|
    	@attributes[age] = attributes [age]
    end

	Student.attribute_age.email do |email|
    	@attributes[email] = attributes ['%@%']
    end

    Student.attribute_phone.each do |phone|
    	@attributes[phone] = attributes [/^\d{3}\D\d{3}\D\d{3,}/]
    end    

    @old_attributes = @attributes.dup
  	end

  	def self.all
    Database::Model.execute("SELECT * FROM students").map do |row|
    Student.new(row)
    end

  	def save
    if new_record?
      results = insert!
    else
      results = update!
    end
    # When we save, remove changes between new and old attributes
    @old_attributes = @attributes.dup
	results
  	end

  	# We say a record is "new" if it doesn't have a defined primary key in its
  	# attributes
  	def new_record?
    self[:id].nil?
  	end
  		                
end