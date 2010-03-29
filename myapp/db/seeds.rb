# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# Create default admin user with his role as admin.
admin = User.create(:email => "admin@centriclocal.com",:login => "admin",:password => "admin",:password_confirmation=> "admin")
role = Role.create(:name => "admin")
assignement = Assignment.create(:role_id => role.id, :user_id => admin.id)

# Here we have created default roles
role = Role.create(:name => "manager")
role = Role.create(:name => "operator")