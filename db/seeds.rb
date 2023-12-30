User.create!([
  { name: "Mike", email: "mike@gmail.com", password: "password", password_confirmation: "password" },
  { name: "Morgan", email: "morgan@gmail.com", password: "password", password_confirmation: "password" },
  { name: "Tracy", email: "tracy@gmail.com", password: "password", password_confirmation: "password" },
  { name: "Scott", email: "scott@gmail.com", password: "password", password_confirmation: "password" },
])

Visit.create!([
  { start_date: Date.new(2023, 12, 01), hospital: "Morton Plant", reason: "broken leg", user_id: 1 },
  { start_date: Date.new(2023, 8, 15), hospital: "Morton Plant", reason: "heartburn", user_id: 1 },
])
