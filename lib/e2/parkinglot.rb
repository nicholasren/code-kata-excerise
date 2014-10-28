class ParkingLot
  def initialize(capacity)
    @capacity = capacity
    @size = 0
    @lots = {}
  end

  def park(car)
    if (@size + 1) <= @capacity
      ticket = Ticket.new
      @lots[ticket] = car
      ticket
    end
  end

  def fetch(ticket)
    @lots[ticket]
  end

  def available_lots
    @capacity - @size
  end
end
