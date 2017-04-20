require_relative "library"

lib = Library.new(f = 'library.yaml')

# lib = Library.new

# v_scott = Author.new("V Scott")
efr = Author.new("Efremov")
lib << efr
tais = Book.new("Tais Af", efr)
lib << tais
 #rob = Book.new("Rob Roy", "V Scott")
# aiv = Book.new("Aivengo","v_scott")
# pert = Book.new("Pert", "v_scott")
# talis = Book.new("Talisman", "v_scott")
chak = Reader.new("Chak", "jjj@i.ua")
lib << chak
# john = Reader.new("John", "111@i.ua")
# will = Reader.new("Will", "123@i.ua")
# alex = Reader.new("Alex", "33@i.ua")
# max = Reader.new("Max", "888@i.ua")

# lib.create_order(rob, john)
# lib.create_order(aiv, will)
# lib.create_order(pert, alex)
# lib.create_order(talis, max)
# lib.create_order(rob, alex)
# lib.create_order(rob, alex)
# lib.create_order(rob, alex)
# lib.create_order(aiv, john)
# lib.create_order(pert, will)
# lib.create_order(rob, max)

 # puts lib.often_takes_book(rob)
 # puts lib.most_popular_book(3)
 # puts lib.how_many_people_ordered_one_of_three_most_popular_books


 lib.save_to_file("library.yaml")

# new_lib = Library.load_from_file("library.yaml")
# puts new_lib.orders