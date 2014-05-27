class Egg

  attr_reader :size, :color

  def initialize(size = %i[S M L].sample, color = %i[B W G].sample)
    @size, @color = size, color
  end

  def <=>(other)
    # %i[S M L]
    case self.size
    when :S
      return 0 if other.size == :S
      return -1
    when :M
      return 1 if other.size == :S
      return 0 if other.size == :M
      return -1 if other.size == :L
    when :L
      return 0 if other.size == :L
      return 1
    else
      raise ArgumentError
    end
  end
end


e1 = Egg.new(:M)
e2 = Egg.new(:S)

p e1 <=> e2

__END__
class EggCarton
  include Enumerable

  SIZE = 12

  def initialize
    @eggs = Array.new(SIZE) { Egg.new }
  end

  def each
    @eggs.each {|egg| yield(egg) }
  end

end


carton1 = EggCarton.new
p carton1.group_by(&:color)

p carton1.max
