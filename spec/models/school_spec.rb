require 'rails_helper'

describe School do
  subject { FactoryBot.build(:school) }

  it 'saves when valid' do
    expect(subject.save).to be true
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

  describe '#title' do
    it 'is required' do
      subject.title = nil
      expect(subject.save).to be false
    end
  end

  describe '#city' do
    it 'is required' do
      subject.city = nil
      expect(subject.save).to be false
    end
  end

  describe '#state' do
    it 'is required' do
      subject.state = nil
      expect(subject.save).to be false
    end
  end
end
