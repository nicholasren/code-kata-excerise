class ParkingBoy
  def initialize(parkinglots)
    @parkinglots = parkinglots
  end

  def park(car)
    lot = @parkinglots.find { |lot| lot.available_lots > 0 }
    lot.nil? ? nil : lot.park(car)
  end

  def fetch(ticket)
    @parkinglots.map{ |lot| lot.fetch(ticket) }.find{ |car| !car.nil? }
  end
end
