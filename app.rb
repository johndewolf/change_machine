require_relative "change_machine"
require_relative "teller"

jim_the_clerk = Teller.new
jim_the_clerk.get_cost
jim_the_clerk.get_amount_paid
jim_the_clerk.dispense_change
