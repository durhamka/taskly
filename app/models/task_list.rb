class TaskList < ActiveRecord::Base
  validates :name, :presence => true
  has_many :tasks

  def incomplete_tasks
    tasks.where(:complete => nil)
  end

  def completed_tasks
    tasks.where(:complete => true)
  end
end