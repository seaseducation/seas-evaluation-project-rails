describe Student do
  subject { FactoryBot.build(:student) }

  it 'saves when valid' do
    expect(subject.save).to be true
  end

  describe '#school' do
    it 'is required' do
      subject.school = nil
      expect(subject.save).to be false
    end
  end

  describe '#grade' do
    it 'is required' do
      subject.grade = nil
      expect(subject.save).to be false
    end
  end

  describe '#program' do
    it 'is optional' do
      subject.program = nil
      expect(subject.save).to be true
    end
  end

  describe '#first_name' do
    it 'is required' do
      subject.first_name = nil
      expect(subject.save).to be false
    end
  end

  describe '#last_name' do
    it 'is required' do
      subject.last_name = nil
      expect(subject.save).to be false
    end
  end

  describe '#first_last_name' do
    it 'returns first and last name' do
      expect(subject.first_last_name).to eq "#{subject.first_name} #{subject.last_name}"
    end
  end
end
