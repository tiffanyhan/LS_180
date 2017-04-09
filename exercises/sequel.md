1.

2.

DB[:customers].select(%i(customers__id name payment_token))
              .distinct
              .join(:customers_services, customer_id: :customers__id)
              .each { |row| puts row[:row] }

3.

DB[:customers].select(%i(customers__id name payment_token))
              .left_join(:customers_services, customer_id: :customers__id)
              .where(service_id: nil)
              .each { |row| puts row[:row] }

4.

customer_info = DB[:customers].select do
  [Sequel.as(split_part(name, ' ', 1), :first_name),
   Sequel.as(split_part(name, ' ', 2), :last_name)]
end

customer_info.left_join(:customers_services, customer_id: :customers__id)
             .left_join(:services, services__id: :service_id)
             .where { price >= 15.00 }
             .order(:last_name, :first_name)
             .distinct
             .limit(3)
             .each { |row| puts "#{row[:last_name]}, #{row[:first_name]}" }

5.

DB[:services].left_join(:customers_services, service_id: :services__id)
             .left_join(:customers, customers__id: :customer_id)
             .select { [description, count(name)] }
             .group(:description)
             .having { count(name) >= 3 }
             .order(:description)
             .each { |row| puts "#{row[:description]}, #{row[:count]}"}

6.

DB[:customers].select { sum(price).cast(:money) }
              .join(:customers_services, customer_id: :customers__id)
              .join(:services, services__id: :service_id)
              .each { |row| puts row[:sum] }

7.

services = ['Unix Hosting', 'DNS', 'Whois Registration']
service_ids = DB[:services].select(:id)
                           .where(description: services)
                           .map(:id)

customer_id = DB[:customers].insert(name: 'John Doe', payment_token: 'EYODHLCN')
service_ids.each do |service_id|
  DB[:customers_services].insert(customer_id: customer_id,
                                 service_id: service_id)
end

DB[:customers].each { |row| puts row }
puts
DB[:customers_services].each { |row| puts row }

8.

ds = DB[:customers]
       .join(:customers_services, customer_id: :customers__id)
       .join(:services, services__id: :service_id)
       .order(:name)
       .group(:name)
       .select do
         service_info = concat('  ', description, ' ', price.cast(:money))
         service_list =
           string_agg(service_info, "\n").order(lower(service_info))

         [ name, service_list.as(:service_list) ]
       end
ds.each { |row| puts row[:name], row[:service_list] }

9.

see average_values.rb

10.

bulk_email_dataset = DB[:services].where(description: 'Bulk Email')
bulk_email_id = bulk_email_dataset.first[:id]

DB[:customers_services].where(service_id: bulk_email_id).delete
bulk_email_dataset.delete

DB[:customers].where(name: 'Chen Ke-Hua').delete

DB[:customers].select(%i(id name)).each { |row| puts row[:row] }
puts
DB[:customers_services].each { |row| puts row }
puts
DB[:services].select(%i(id description)).each { |row| puts row[:row] }
