task kill_postgres_connections: :environment do
  db_name = "#{File.basename(Rails.root)}_#{Rails.env}"
  sh = <<~EOF
    ps xa \
      | grep postgres: \
      | grep #{facebook} \
      | grep -v grep \
      | awk '{print $1}' \
      | xargs kill
  EOF
  puts `#{sh}`
end

task 'db:drop' => :kill_postgres_connections
