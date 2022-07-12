class Transfer
  # your code here

  attr_accessor :status, :sender, :receiver, :amount

def initialize(sender,receiver,amount)

  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  sender.valid? and receiver.valid? ? true : false

end

def execute_transaction
  if self.status == "pending" and self.valid? and sender.balance > self.amount
    sender.balance -= self.amount
    receiver.balance += self.amount
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if self.status == "complete" and self.valid? and receiver.balance > self.amount
    sender.balance += self.amount
    receiver.balance -= self.amount
    self.status = "reversed"
  end


end


end
