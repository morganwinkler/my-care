# User.create!([
#   { name: "Mike", email: "mike@gmail.com", password: "password", password_confirmation: "password" },
#   { name: "Morgan", email: "morgan@gmail.com", password: "password", password_confirmation: "password" },
#   { name: "Tracy", email: "tracy@gmail.com", password: "password", password_confirmation: "password" },
#   { name: "Scott", email: "scott@gmail.com", password: "password", password_confirmation: "password" },
# ])

# Visit.create!([
#   { start_date: Date.new(2023, 12, 01), hospital: "Morton Plant", reason: "broken leg", user_id: 1 },
#   { start_date: Date.new(2023, 8, 15), hospital: "Morton Plant", reason: "heartburn", user_id: 1 },
# ])

# Doctor.create!([
#   { name: "Rob Smith", specialty: "Orthopedic", visit_id: 1, note: "blah blah" },
#   { name: "Karen Hodge", specialty: "Surgeon", visit_id: 1, note: "blah blah" },
#   { name: "Lisa Smith", specialty: "General", visit_id: 1, note: "blah blah" },
#   { name: "Bob Bob", specialty: "Cardio", visit_id: 2, note: "blah blah" },
#   { name: "Lisa Bob", specialty: "Gastro", visit_id: 2, note: "blah blah" },
# ])

# Nurse.create!([
#   { name: "Blake", date: Date.new(2023, 12, 01), time: "am", visit_id: 1, note: "very attentive" },
#   { name: "Britt", date: Date.new(2023, 12, 01), time: "pm", visit_id: 1, note: "sweet" },
# ])

Medication.create!([
  { name: "Tylenol", reason: "pain", visit_id: 1, note: "need stronger dose" },
  { name: "Atenolol", reason: "blood pressure", visit_id: 1 },
  { name: "Aspirin", reason: "prevention", visit_id: 1 },
])
