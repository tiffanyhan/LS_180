require 'sequel'
DB = Sequel.connect('postgres://localhost/sequel-single-table')

def format_money(numeric)
  format('$%.2f', numeric)
end

result = DB[:menu_items].select{
  labor_calc = (prep_time / 60.0) * 12
  profit_calc = menu_price - ingredient_cost - labor_calc
  [item, menu_price, ingredient_cost, labor_calc.as(labor), profit_calc.as(profit)]
}.all

result.each do |row|
 puts row[:item]
 puts "menu price: #{format_money(row[:menu_price])}"
 puts "ingredient cost: #{format_money(row[:ingredient_cost])}"
 puts "labor: #{format_money(row[:labor])}"
 puts "proft: #{format_money(row[:profit])}"
 puts
end