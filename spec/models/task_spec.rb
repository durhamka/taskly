require 'rails_helper'

describe Task do
  describe 'validations' do
    it 'requires presence of description' do
      task = Task.new

      expect(task).to_not be_valid
      expect(task).to have(1).error_on(:description)
    end
  end
end
