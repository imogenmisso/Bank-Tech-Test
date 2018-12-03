class Account

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
    else
      @balance
    end 
  end

end
