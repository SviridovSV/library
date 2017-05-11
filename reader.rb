class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, options = {})
    @name = name
    @email = email
    @city = options[:city]
    @street = options[:street]
    @house = options[:house]
  end

  def to_s
    "#{@name}, e-mail:#{@email}"
  end
end