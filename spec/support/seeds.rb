class ActiveRecord::Base
  def self.seed(data_table)
    data_table = data_table.strip.split(/\s*\n\s*/)
    data_table.reject!{|row| row =~ /---/ }

    headers = data_table.shift.split(/\s*\|\s*/)[1..-1]

    delete_all

    data_table.each do |row|
      data = Hash[*headers.zip(row.split(/\s*\|\s*/)[1..-1]).flatten].with_indifferent_access
      if data[primary_key]
        columns, values = data.each_with_object([[], []]) do |(c,v), (cols, vals)|
          cols << connection.quote_column_name(c)
          vals << connection.quote(v)
        end
        connection.execute("INSERT INTO #{table_name} (#{ columns * ', ' }) VALUES (#{ values * ', ' })")
      else
        create(data)
      end
    end
  end
end

Translation.seed %q{
  +---------+--------+-------+--------------+
  | user_id | locale | key   | value        |
  +---------+--------+-------+--------------+
  |       1 | en     | hello | Hello        |
  |       1 | es     | hello | Hola         |
  |       1 | de     | hello | Hallo        |
  |       2 | en     | hello | Good morning |
  |       2 | es     | hello | Buenos días  |
  |       2 | jp     | hello | おはよう     |
  +---------+--------+-------+--------------+
}

User.seed %q{
  +----+--------+
  | id | name   |
  +----+--------+
  |  1 | Alice  |
  |  2 | Bob    |
  +----+--------+
}
