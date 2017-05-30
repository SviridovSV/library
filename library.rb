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
    %w[order book reader author].each do |value|
      if object.class == value.capitalize
        instance_variable_get("@#{value}s") << object
      end
    end
  end

  def often_takes_book(book)
    raise TypeError, 'Wrong book type' unless book.kind_of?(Book)
    @orders.select { |order| order.book.to_s == book.to_s }.group_by(&:reader).max_by { |key, value| value.size }.first
  end

  def most_popular_book(quantity)
    orders_with_popular_books(quantity).to_h.keys
  end

  def how_many_people_ordered_one_of_three_most_popular_books
    orders_with_popular_books(3).map{ |book| book.flatten[1] }.group_by(&:reader).count
  end

  def save_to_file(f = 'library.yaml')
    File.open(f, "w") { |f| f.write(YAML.dump(self)) } ? true : "This file doesn't exist"
  end

  private

  def orders_with_popular_books(quantity)
    @orders.group_by(&:book).max_by(quantity) { |key, value| value.size }
  end
end

