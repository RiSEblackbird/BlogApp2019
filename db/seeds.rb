table_names = %w(members article)
table_names.each do |table_name|
  path = Rails.root.join("db/seed", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require path
  end
end
