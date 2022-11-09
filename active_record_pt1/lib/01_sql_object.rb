require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @table ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        cats
      LIMIT 0
      SQL
    @table.first.map{|el| el.to_sym}
  end

  def self.finalize!

    self.columns.each do |coln|
      define_method("#{coln}=") do |new_val|
        attributes[coln] = new_val #attributes returns the @attributes hash
        #same as: h = attributes
        #         h[coln] = new_val
      end
      define_method("#{coln}") do
        attributes[coln]
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.downcase + 's'
    @table_name
  end

  def self.all
    
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
