require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    wherizit = params.keys.map { |ele| "#{ele} = ?" }.join(" AND ")
    stuff = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM 
        #{self.table_name}
      WHERE
        #{wherizit}
    SQL


    parse_all(stuff)
  end
end

class SQLObject
  extend Searchable
end
