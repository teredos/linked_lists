# frozen_string_literal: true

# Creates class 'Node' which contains data and a link to the next node
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
