class RandomMentira
  include Random

  def initialize
    @i = 0
  end

  def next_u
    @i += 1
  end
end
