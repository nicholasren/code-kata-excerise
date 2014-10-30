class SmartParkingBoy < ParkingBoy
  def park car
    lot = @parkinglots.sort_by(&:available_lots).last
    lot.parkable? ? lot.park(car) : nil
  end

end
