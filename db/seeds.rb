User.create(
  { name: 'HR Admin', email: 'admin@textile.com', password: '12345678', password_confirmation: '12345678' }
)

Entry.create([
  { badge_number: '1234567890', check_in: DateTime.new(2016, 11, 15, 8, 59, 0), check_out: DateTime.new(2016, 11, 15, 18, 0, 0) },
  { badge_number: '1234567890', check_in: DateTime.new(2016, 11, 16, 8, 59, 0), check_out: DateTime.new(2016, 11, 15, 18, 0, 0) },
  { badge_number: '1234567890', check_in: DateTime.new(2016, 11, 17, 8, 59, 0), check_out: DateTime.new(2016, 11, 15, 18, 0, 0) },
  { badge_number: '1234567890', check_in: DateTime.new(2016, 11, 18, 9, 59, 0), check_out: DateTime.new(2016, 11, 15, 18, 0, 0) },
  { badge_number: '1234567890', check_in: DateTime.new(2016, 11, 21, 9, 59, 0), check_out: DateTime.new(2016, 11, 15, 18, 0, 0) },
  { badge_number: '1234567890', check_in: DateTime.new(2016, 11, 22, 8, 59, 0) }
])
