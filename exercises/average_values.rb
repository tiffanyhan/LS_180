require 'sequel'

puts "What database do you want to use?"
db = gets.chomp

puts "What table do you want to use?"
t = gets.chomp

DB = Sequel.connect('postgres://localhost/' + db)
table = DB[t.to_sym]

table.columns.sort.each do |column|
  begin
    average = table.avg(column)
    puts "#{column}: #{average.to_f}" if average
  rescue Sequel::DatabaseError
    next
  end
end

DB.disconnect