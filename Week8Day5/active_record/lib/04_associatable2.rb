require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

      through_name = through_options.table_name
      through_id = through_options.primary_key
      through_four = through_options.foreign_key

      source_name = source_options.table_name
      source_id = source_options.primary_key
      source_four = source_options.foreign_key

      answers = DBConnection.execute(<<-SQL, id)
        SELECT
         #{source_name}.*
        FROM
        #{through_name} --human
        JOIN
        #{source_name} --house
        ON
        #{through_name}.#{source_four} = #{source_name}.#{source_id}
        WHERE 
        #{through_name}.#{through_id} = ?
      SQL

      source_options.model_class.parse_all(answers).first
    end
  
  end
end
