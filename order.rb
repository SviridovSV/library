class Order

  attr_reader :book, :reader, :date

  def initialize(book, reader)
    @book = book.to_s
    @reader = reader.to_s
    @date = Time.now.strftime('%d-%m-%Y')
  end

  def to_s
    "#{@book}, #{@reader}, #{@date}"
  end
end