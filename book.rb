class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title, @author = title, author
  end

  def to_s
    "#{title}, #{author}"
  end
end