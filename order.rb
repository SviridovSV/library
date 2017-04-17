class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader)
    raise TypeError, book unless book.instance_of?(Book)
    raise TypeError, reader unless reader.instance_of?(Reader)

    @book = book.to_s
    @reader = reader.to_s
    @date = Time.now.strftime('%d-%m-%Y')
  end
end