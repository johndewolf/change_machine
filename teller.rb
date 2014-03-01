class Teller
  attr_accessor :cost, :paid

  def initialize
    @change_machine = ChangeMachine.new
  end

  def get_cost
      puts "Please enter the amount the item costs"
      @change_machine.amount_due = gets.chomp

      if !valid?(@change_machine.amount_due)
        puts "You entered an invalid amount"
        get_cost
      else
        @change_machine.amount_due = @change_machine.amount_due.to_f
      end
  end

  def get_amount_paid
    puts "Please enter the amount paid"
    @change_machine.amount_paid = gets.chomp

    if !valid?(@change_machine.amount_paid)
      puts "You entered an invalid amount"
      get_amount_paid
    else
      @change_machine.amount_paid = @change_machine.amount_paid.to_f
    end
  end

  def dispense_change
    @change_machine.small_change_due.each do |name, value|
        puts "#{name}: #{value}"
    end

    @change_machine.bills_due.each do |bill, value|
        puts "#{bill}: #{value}"
    end
  end


  private

  def valid?(num)
    !!num.match(/\A\d+(\.\d{2})*\z/)
  end
end