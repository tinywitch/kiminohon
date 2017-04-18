# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
	{username:"admin", email:"admin@gmail.com", password:"password", password_confirmation:"password", role: 1},
	{username:"user", email:"user@gmail.com", password:"password", password_confirmation:"password"}
])

Category.create_category([
	{"category" => "Sách Đoạt Giải Thưởng", "slug" => ""},
	{"category" => "Sách Văn Học - Tiểu Thuyết", "slug" => ""},
	{"category" => "Sách Kinh Tế", "slug" => ""},
	{"category" => "Sách Truyện Thiếu Nhi", "slug" => ""},
	{"category" => "Sách Nuôi Dạy Con", "slug" => ""},
	{"category" => "Sách Giáo Khoa - Tham Khảo", "slug" => ""},
	{"category" => "Sách Học Ngoại Ngữ", "slug" => ""},
	{"category" => "Sách Tiếng Anh", "slug" => ""},
	{"category" => "Từ điển", "slug" => ""},
	{"category" => "Truyện Tranh, Manga, Comic", "slug" => ""},
	{"category" => "Sách Kỹ Năng", "slug" => ""},
	{"category" => "Khoa Học - Kỹ Thuật", "slug" => ""},
	{"category" => "Kiến Thức Tổng Hợp", "slug" => ""},
	{"category" => "Chính Trị - Pháp Lý", "slug" => ""},
	{"category" => "Giáo Trình Đại Học - Cao Đẳng", "slug" => ""},
	{"category" => "Tạp Chí - Catalogue", "slug" => ""},
	{"category" => "Thường Thức - Đời Sống", "slug" => ""},
	{"category" => "Tâm lý - Giới tính", "slug" => ""},
	{"category" => "Sách Cho Tuổi Mới Lớn", "slug" => ""},
	{"category" => "Sách Tô Màu", "slug" => ""}
])
