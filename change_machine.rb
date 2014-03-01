class ChangeMachine
  attr_accessor :amount_paid, :amount_due

  def initialize
    @amount_paid = amount_paid.to_f
    @amount_due = amount_due.to_f
    @coins = {quarters: 25, dimes:10, nickels: 5, pennies: 1}
    @bills = {hundreds: 100, twenties: 20, tens: 10, fives: 5, ones: 1}
  end

  def calculate_change
    (@amount_paid - @amount_due).round(2)
  end

  def small_change_due
    coins_due = {}

    small_change = calculate_change.to_s.split(".").at(1).to_i
    @coins.each do |coin, value|
      coins_due[coin] = small_change / value
      small_change -= coins_due[coin] * value
    end
    coins_due.delete_if{ |coin, value| value == 0 }
  end

  def bills_due
    bills_due = {}
    bills = calculate_change.to_s.split(".").at(0).to_i

    @bills.each do |bill, value|
      bills_due[bill] = bills / value
      bills -= bills_due[bill] * value
    end
    bills_due.delete_if{|bill, value| value == 0}
  end
end
