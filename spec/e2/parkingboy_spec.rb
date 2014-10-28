require 'spec_helper'

describe ParkingBoy do
  let(:car) { Car.new('Skoda Octiva') }

  context 'parkingboy' do
    let(:capacities) { [1, 1] }
    let(:parkinglots) { capacities.map { |capacity| ParkingLot.new(capacity) } }
    let(:parkingboy) { ParkingBoy.new(parkinglots) }

    context 'parking' do
      subject { parkingboy.park(car) }

      context 'have capacity' do
        let(:capacities) { [1, 1] }

        specify { expect(subject).to_not be_nil }
      end

      context 'have no capacity' do
        let(:capacities) { [0, 0] }

        specify { expect(subject).to be_nil }
      end
    end

    context 'fetch' do
      subject { parkingboy.fetch(ticket) }

      context 'valid ticket' do
        let(:ticket) { parkingboy.park(car) }
        specify { expect(subject).to eq(car)}
      end

      context 'invalid ticket' do
        let(:ticket) { nil }
        specify { expect(subject).to be_nil }
      end

    end
  end
end
