require 'csv'
INSPECTION_ID = 0
DBA = 1
AKA = 2
LICENSE_NUMBER= 3
FACILITY_TYPE = 4
RISK = 5
ADDRESS = 6
CITY = 7
STATE = 8
ZIP = 9
INSPECTION_DATE = 10
INSPECTION_TYPE = 11
RESULTS = 12
VIOLATIONS = 13
LATITUDE = 14
LONGITUDE = 15
LOCATION = 16

class SeedCSV

  def self.begin_csv
    seed = SeedCSV.new
    seed.generate_from_csv
  end

  def generate_from_csv
    Facility.destroy_all
    Inspection.destroy_all
    index = 0
    CSV.foreach("db/Food_Inspections.csv") do |row|
      if index == 0
        index += 1
        next
      end

      facility = Facility.create(dba_name: row[DBA], aka_name: row[AKA], license: row[LICENSE_NUMBER], facility_type: row[FACILITY_TYPE], address: row[ADDRESS], city: row[CITY], state: row[STATE], zip: row[ZIP])

      inspection = Inspection.create(official_id: row[INSPECTION_ID], inspection_type: row[INSPECTION_TYPE], date: row[INSPECTION_DATE], results: row[RESULTS], facility_id: facility.id)

      puts facility.dba_name
      puts row[LOCATION]



      index += 1
      if index == 20 then break end
    end
  end
end

class SeedFaker

  def self.begin
    seed = SeedFaker.new
    Facility.destroy_all
    facilities_range = seed.generate_facilities(20)
    Inspection.destroy_all
    inspections_range = seed.generate_inspections(20, facilities_range)
    Violation.destroy_all
    violations_range = seed.generate_violations(20)
    InspectionViolation.destroy_all
    seed.generate_inspection_violations(20, inspections_range, violations_range)
  end

  def generate_facilities(n)
    first_id = nil

    n.times do |i|
      facility = Facility.create!(
        dba_name: Faker::Book.author,
        aka_name: Faker::ChuckNorris.fact
      )

      if i == 0 then first_id = facility.id end

      puts "Facility #{i}: DBA name is #{facility.dba_name} and AKA name is '#{facility.aka_name}'."
    end
    first_id..(first_id + n-1)
  end

  def generate_violations(n)
    first_id = nil

    n.times do |i|
      violation = Violation.create!(
        official_id: i,
        body: Faker::ChuckNorris.fact
      )

      if i == 0 then first_id = violation.id end

    end
    first_id..(first_id + n-1)
  end

  def generate_inspections(n, facilities_range)
    first_id = nil

    n.times do |i|
      inspection = Inspection.create!(
        official_id: i,
        facility_id: rand(facilities_range)
      )

      if i == 0 then first_id = inspection.id end

    end
    first_id..(first_id + n-1)
  end

  def generate_inspection_violations(n, inspections_range, violations_range)
    n.times do |i|
      inspection_violation = InspectionViolation.create!(
        inspection_id: rand(inspections_range),
        violation_id: rand(violations_range)
      )
    end
  end
end

SeedCSV.begin_csv
