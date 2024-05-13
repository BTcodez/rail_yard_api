
material1 = RawMaterial.create!(material_name: "Corn Syrup")
material2 = RawMaterial.create!(material_name: "Sucralose")
material3 = RawMaterial.create!(material_name: "AMS")

# Seed Orders



orders = [
  { car_id: "VTGX017400", requested_date: "2024-05-06", received_date: "2024-01-05", extraction_start: "2024-01-08", extraction_end: "2024-01-10", release_date: "2024-01-10", raw_material_id: material1.id },
  { car_id: "UTLX064972", requested_date: "2024-05-06", received_date: "2024-01-05", extraction_start: "2024-01-08", extraction_end: "2024-01-10", release_date: "2024-01-10", raw_material_id: material2.id },
  { car_id: "UTLX601220", requested_date: "2024-04-15", received_date: "2024-04-18", extraction_start: "2024-01-08", extraction_end: "2024-01-10", release_date: "2024-01-10", raw_material_id: material3.id },
  { car_id: "SHPX205057", requested_date: "2024-01-02", received_date: "2024-01-05", extraction_start: "2024-01-08", extraction_end: "2024-01-10", release_date: "2024-01-10", raw_material_id: material3.id },
  { car_id: "UTLX066842", requested_date: "2024-01-02", received_date: "2024-01-06", extraction_start: "2024-01-07", extraction_end: "2024-01-10", release_date: "2024-01-10", raw_material_id: material1.id }
]

user = User.first
user.orders.create!(orders)