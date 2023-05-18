require_relative 'app'

def main(options)
  app = App.new

  loop do
    display_menu

    option = gets.chomp.to_i

    if option == 7
      puts 'Exiting...'
      break
    elsif options[option]
      options[option].call(app)
    else
      puts 'Invalid option'
    end
  end
end

def display_menu
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Exit'
end

def handle_list_books(app)
  app.list_books
end

def handle_list_people(app)
  app.list_people
end

def handle_create_person(app)
  app.create_person
end

def handle_create_book(app)
  app.create_book
end

def handle_create_rental(app)
  app.create_rental
end

def handle_list_rentals(app)
  app.list_rentals
end

options = {
  1 => method(:handle_list_books),
  2 => method(:handle_list_people),
  3 => method(:handle_create_person),
  4 => method(:handle_create_book),
  5 => method(:handle_create_rental),
  6 => method(:handle_list_rentals)
}

main(options)
