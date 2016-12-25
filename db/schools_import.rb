require 'csv'

CSV.foreach(Rails.root + 'tmp/oklahoma_schools.csv', :headers => :first_row) do |row|
  begin
    school = School.create!(
      :name        => row['School Site'].strip.titleize,
      :address_1   => row['Mailing Address']&.strip,
      :city        => row['Mailing City']&.strip,
      :state       => row['Mailing State']&.strip,
      :postal_code => row['Mailing Zip']&.strip,
      :data        => row.to_h,
    )
  rescue
    ap row
    raise
  end
end
