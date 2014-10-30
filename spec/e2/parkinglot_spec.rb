require 'spec_helper'

describe ParkingLot do
  let(:capacity) { 10 }
  let(:car) { Car.new('Skoda Octiva') }

  context 'parkinglot' do
    let(:parkinglot) {  ParkingLot.new(capacity) }
    context 'parking' do
      subject { parkinglot.park(car) }

      context 'have capacity' do
        let(:capacity) { 1 }

        specify { expect(subject).to_not be_nil }
      end

      context 'have no capacity' do
        let(:capacity) { 0 }

        specify { expect(subject).to be_nil }
      end

    end

    context 'fetch' do
      subject { parkinglot.fetch(ticket) }

      context 'valid ticket' do
        let(:ticket) { parkinglot.park(car) }

        specify { expect(subject).to eq(car) }
      end

      context 'invalid ticket' do
        let(:ticket) { nil }

        specify { expect(subject).to be_nil }
      end

      context 'fake ticket' do
        let(:ticket) {  Ticket.new(double(Car)) }

        specify { expect(subject).to be_nil }
      end
    end
  end
end
