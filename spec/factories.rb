Factory.define :chef, :default_strategy => :build do |f|
 f.sequence(:email) {|n| "author#{n}@example.com"}
 f.sequence(:confirmation_token) {|n| "confirmation#{n}"}
 f.sequence(:reset_password_token) {|n| "reset_password_token#{n}"}
 f.password 'test1234'
 f.encrypted_password "password"
 f.password_salt "password"
end

Factory.define :user, :default_strategy => :build do |f|
 f.password 'lazysignup'
end

Factory.define :recipe, :default_strategy => :build do |f|
end

Factory.define :step, :default_strategy => :build do |f|
end