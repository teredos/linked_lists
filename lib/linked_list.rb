# frozen_string_literal: true

require_relative 'node'

# class LinkedList which contains and links the list of nodes
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
  end

  def size(list = @head, length = 0)
    return length if list.nil?

    length += 1
    size(list.next_node, length)
  end

  def at(index, num = 0, node = @head)
    if index == num
      node.value
    else
      return if node.next_node.nil?

      num += 1
      at(index, num, node.next_node)
    end
  end

  def pop(node = @head)
    last_value = @tail.value.dup unless @tail.nil?
    if @head == @tail
      @head = @tail = nil
    elsif node.next_node == @tail
      @tail = node
      node.next_node = nil
    else
      pop(node.next_node)
    end
    last_value
  end

  def contains?(value, node = @head)
    if node.nil?
      return false
    elsif node.value == value
      return true
    end

    contains?(value, node.next_node)
  end

  def find(value, node = @head, index = 0)
    if node.nil?
      return nil
    elsif node.value == value
      return index
    end

    index += 1
    find(value, node.next_node, index)
  end

  def to_s(node = @head, str = '')
    return str += 'nil' if node.nil?

    str += "( #{node.value} ) -> "
    to_s(node.next_node, str)
  end

  def insert_at(value, index, node = @head, pos = 0)
    if index == pos
      node.next_node = node.dup
      node.value = value
    elsif node.next_node.nil? && index == pos + 1
      node.next_node = @tail = Node.new(value)
    else
      pos += 1
      insert_at(value, index, node.next_node, pos)
    end
  end

  def remove_at(index, node = @head, pos = 0)
    if index.zero?
      @head = node.next_node
    elsif index - 1 == pos
      node.next_node = node.next_node.next_node
      @tail = node
    else
      pos += 1
      remove_at(index, node.next_node, pos)
    end
  end
end
