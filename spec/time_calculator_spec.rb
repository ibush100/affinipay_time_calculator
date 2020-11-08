require 'time_calculator'

# spec/string_calculator_spec.rb
describe TimeCalculator do
  tc = TimeCalculator.new
  describe 'As a user I want to add a number of minutes to a time represented as a String.' do

    context 'add minutes to time' do
      it 'returns 12:30 PM' do
        expect(tc.add_minutes('09:10 AM', 200)).to eq('12:30 PM')
      end

      context 'add small amount of minutes to time' do
        it 'returns 09:15 AM' do
          expect(tc.add_minutes('09:10 AM', 5)).to eq('09:15 AM')
        end
      end

      context 'add 24 hours to time' do
        it '09:10 AM' do
          expect(tc.add_minutes('09:10 AM', 1440)).to eq('09:10 AM')
        end
      end
      context 'add 12 hours to time' do
        it 'returns 09:10 PM' do
          expect(tc.add_minutes('09:10 AM', 720)).to eq('09:10 PM')
        end
      end
      context 'add negative value to time' do
        it 'returns exception' do
          expect{tc.add_minutes('09:10 AM', -1)}.to raise_error(RuntimeError)
        end
      end
    end
  end


end