require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'classroom'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each do |person|
      type = '[student]' if person.is_a? Student
      type = '[teacher]' if person.is_a? Teacher
      puts "#{type} Name: #{person.name},  ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? (Y/N)'
    parent_permission = gets.chomp == 'Y'
    student = Student.new(age, nil, name: name, parent_permission: parent_permission)
    @people << student
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Specialization:'
    specialization = gets.chomp
    puts 'Name:'
    name = gets.chomp
    parent_permission = true
    teacher = Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
    @people << teacher
    puts 'Person created successfully'
  end

  def create_person
    puts 'Do you want to create a student (1) or teacher (2) [Input the number]:'
    option = gets.chomp.to_i
    if option == 1
      create_student
    elsif option == 2
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    selected_book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) #{person.name}, #{person.age} years old"
    end
    person_index = gets.chomp.to_i
    selected_person = @people[person_index]
    puts 'Date:'
    date = gets.chomp
    rental = Rental.new(date, selected_book, selected_person)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person_rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    person_rentals.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
    end
  end
end
