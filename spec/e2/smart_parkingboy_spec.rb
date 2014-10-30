require 'spec_helper'

describe SmartParkingBoy do
  let(:car) { Car.new('Skoda Octiva') }

  context 'smart parkingboy' do
    let(:few_avaliable_lot) { ParkingLot.new(2) }
    let(:no_avaliable_lot) { ParkingLot.new(0) }
    let(:more_available_lot) { ParkingLot.new(3) }
    let(:parkinglots) { [few_avaliable_lot, more_available_lot] }
    let(:parkingboy) { SmartParkingBoy.new(parkinglots) }

    context 'parking' do
      subject { parkingboy.park(car) }

      context 'have capacity' do
        it 'should park to the one has more available lots' do
          expect{subject}.to change{ more_available_lot.available_lots }.by(-1)
        end
      end

      context 'have no capacity' do
        let(:parkinglots) { [no_avaliable_lot] }
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
