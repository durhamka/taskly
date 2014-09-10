class TaskList < ActiveRecord::Base
  validates :name, :presence => true
  has_many :tasks

  def incomplete_tasks
    tasks.where(:complete => nil)
  end
end