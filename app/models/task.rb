class Task < ApplicationRecord
  belongs_to :category

  VALID_STATUSES = ['To-do', 'In Progress', 'Completed', 'On Hold']

  validates :status, inclusion: { in: VALID_STATUSES }

  def duetoday?
    due_date == Date.today
  end

  def todo?
    status == 'To-do'
  end

  def inprogress?
    status == 'In Progress'
  end

  def completed?
    status == 'Completed'
  end

  def onhold?
    status == 'On Hold'
  end

end
