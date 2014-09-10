require 'rails_helper'

describe TaskList do
  describe 'validations' do
    it 'requires a presence of name' do
      task_list = TaskList.new

      expect(task_list).to_not be_valid
      expect(task_list).to have(1).error_on(:name)
    end
  end
end