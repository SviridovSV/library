class Book
  attr_reader :title, :author

  def initialize(title, author)
    raise TypeError, author unless author.instance_of? Author
    @title, @author = title, author
  end

  def to_s
    "#{title}, #{author}"
  end
end