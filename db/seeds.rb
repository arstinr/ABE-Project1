# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Category.destroy_all
Task.destroy_all

# Create Categories
category1 = Category.create!(name: "Work", details: "Tasks related to work")
category2 = Category.create!(name: "Home", details: "Household chores and tasks")
category3 = Category.create!(name: "Hobbies", details: "Tasks related to hobbies and personal projects")

puts "Categories created"

# Create Tasks for each category
Task.create!(
  name: "Finish the project report",
  details: "Complete the final draft of the project report before the deadline.",
  status: false,
  due_date: DateTime.now + 2.days,
  category: category1
)

Task.create!(
  name: "Weekly meeting",
  details: "Attend the weekly team meeting.",
  status: false,
  due_date: DateTime.now + 1.week,
  category: category1
)

Task.create!(
  name: "Grocery shopping",
  details: "Buy groceries for the week.",
  status: false,
  due_date: DateTime.now + 1.day,
  category: category2
)

Task.create!(
  name: "Clean the house",
  details: "Deep cleaning of the entire house.",
  status: true,
  due_date: DateTime.now - 3.days,  # Overdue task
  category: category2
)

Task.create!(
  name: "Finish reading a book",
  details: "Complete reading 'Atomic Habits'.",
  status: false,
  due_date: DateTime.now + 5.days,
  category: category3
)

Task.create!(
  name: "Work on personal website",
  details: "Redesign the portfolio section on the personal website.",
  status: false,
  due_date: DateTime.now + 3.days,
  category: category3
)

puts "Tasks created"
