require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @anything if @anything
    col = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0;
    SQL
    @anything = col.first.map!(&:to_sym)
    # @attributes ||= {}
    # @attributes.hash_map!(&:to_sym)
  end

  def self.finalize!
    return nil if self.nil?
    self.columns.each do |name|
      define_method(name) do 
        self.attributes[name]
      end
    
      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
      @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.downcase.pluralize
  end

  def self.all
    hash_list = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name};
    SQL

    parse_all(hash_list)
  end

  def self.parse_all(results)
    objects = results.map { |hash| self.new(hash) }
  end

  def self.find(id) # Cat.find
    finders = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name} 
      WHERE
        #{self.table_name}.id = ?
    SQL
    parse_all(finders).first
  end

  def initialize(params = {}) # c = Cat.new // self = c // c.attributes
    params.each do |key, value|
      key = key.to_sym
      if self.class.columns.include?(key)
        self.send("#{key}=", value)
      else 
        raise "unknown attribute '#{key}'" #WHY do we need this inner quotation mark ...
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert
    col_names = self.class.columns.drop(1).join(", ")
    question_marks = (["?"] * self.class.columns.drop(1).count).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update 
    set = self.class.columns.map { |col| "#{col} = ?"}.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set} 
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if id.nil?
      insert
    else
      update 
    end
  end
end
