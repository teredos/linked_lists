# frozen_string_literal: true

require_relative 'lib/linked_list'

linked_list = LinkedList.new

linked_list.append(2)
linked_list.prepend(1)
linked_list.size
linked_list.head
linked_list.tail
linked_list.at(1)
linked_list.pop
linked_list.contains?(1)
linked_list.contains?(2)
linked_list.find(1)
linked_list.find(2)
linked_list.to_s
linked_list.insert_at(2, 1)
linked_list.insert_at(0, 0)
linked_list.remove_at(2)
linked_list.remove_at(0)
