require_relative "library"

lib = Library.new(f = 'library.yaml')

efr = Author.new("Efremov")
lib << efr

tais = Book.new("Tais Af", efr)
lib << tais

chak = Reader.new("Chak", "jjj@i.ua")
lib << chak

rob = Book.new("Rob Roy", "V Scott")
puts lib.often_takes_book(rob)

puts lib.most_popular_book(3)

puts lib.how_many_people_ordered_one_of_three_most_popular_books


lib.save_to_file("library.yaml")

