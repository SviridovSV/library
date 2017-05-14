require_relative "author"
require_relative "book"
require_relative "reader"
require_relative "order"
require "yaml"

class Library
  attr_reader :books, :orders, :readers, :authors

  def initialize(f = 'library.yaml')
    if File.exists?(f)
      library = YAML.load(File.read(f))
      @books = library.books
      @orders = library.orders
      @readers = library.readers
      @authors = library.authors
    else
      @books = []
      @orders = []
      @readers = []
      @authors = []
    end
  end

  def <<(object)
    type = object.class
    case
    when type == Book
      @books << object unless @books.include?(object)
    when type == Author
      @authors << object unless @authors.include?(object)
    when type == Reader
      @readers << object unless @readers.include?(object)
    when type == Order
      @orders << object unless @orders.include?(object)
    else
      "You may add only Book, Author, Reader or Order"
    end
  end

  def often_takes_book(book)
    raise TypeError, 'Wrong book type' unless book.kind_of?(Book)
    @orders.select { |order| order.book.to_s == book.to_s }.group_by(&:reader).max_by { |key, value| value.size }.first
  end

  def most_popular_book(quantity)
    @orders.group_by(&:book).max_by(quantity) { |key, value| value.size }.to_h.keys
  end

  def how_many_people_ordered_one_of_three_most_popular_books
    best_books = most_popular_book(3)
    count_people = {}
    best_books.each do |book|
      count_people[book.to_s] = @orders.find_all { |order| order.book.to_s == book.to_s }.count
    end
    count_people.each {|book, count| "#{book}:#{count}"}
  end

  def save_to_file(f = 'library.yaml')
    File.open(f, "w") { |f| f.write(YAML.dump(self)) } ? true : "This file doesn't exist"
  end
end
