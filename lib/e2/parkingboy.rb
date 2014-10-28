class ParkingBoy
  def initialize(parkinglots)
    @parkinglots = parkinglots
  end

  def park(car)
    lot = @parkinglots.find do |lot|
      lot.available_lots > 0
    end

    lot.nil? ? nil : lot.park(car)
  end
end
