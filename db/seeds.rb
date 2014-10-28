# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Global Constant Variables
GEN_USERS = 10

# ----------------------------------

# * Extending Faker frame *
# module Faker
#   class MakeDate < Base
#     class << self
# monkey patch 'something'
#       def something(defaultInt=1)
#         ...
#       end
#     end
#   end
# end

# ----------------------------------

# clean all the previous data out of the DB
def delete_all
  User.delete_all
end

# generate a set of users & populate table
def generate_users
  @users = (1..GEN_USERS).to_a
  (1..@users.length).each do |user|
    username = Faker::Internet.user_name
    email = Faker::Internet.safe_email(username)
    unless User.create!(username: username, email: email)
      puts "*********** ERROR ******************"
    end
  end
end

# ----------------------------------

##
# delete table contents and re-populate
delete_all
generate_users

# eof----------------------------------
