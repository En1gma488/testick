FactoryBot.define :user do |f|
  	 f.first_name 	"John" 
    f.last_name   "Doe" 
  	 f.sequence(:email) { |i| "email#{i}@email.com"}
    f.password "password"
    f.password_confirmation { |u| u.password }
  end
end