class ParkingLot
  def initialize(capacity)
    @capacity = capacity
    @lots = {}
  end

  def park(car)
    if parkable?
      ticket = Ticket.new(self)
      @lots[ticket] = car
      ticket
    end
  end

  def fetch(ticket)
    @lots[ticket]
  end

  def available_lots
    @capacity - @lots.size
  end

  def parkable?
    available_lots > 0
  end
end
