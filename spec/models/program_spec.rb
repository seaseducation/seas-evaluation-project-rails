describe Program do
  subject { FactoryBot.build(:program) }

  it 'saves when valid' do
    expect(subject.save).to be true
  end

  describe '#title' do
    it 'is required' do
      subject.title = nil
      expect(subject.save).to be false
    end

    it 'must be valid' do
      subject.title = 'Invalid'
      expect(subject.save).to be false
    end
  end

  describe '#students' do
    it 'can have many' do
      students = 3.times.map { FactoryBot.build(:student) }
      subject.students = students

      expect(subject.save).to be true
    end

    it 'can have none' do
      subject.students = []

      expect(subject.save).to be true
    end
  end
end
