# frozen_string_literal: true

# Class definition of doubly linked list
class ListNode
  attr_accessor :key, :val, :next, :prev

  def initialize(key = 0, val = 0, next_node = nil, prev_node = nil)
    @key = key
    @val = val
    @next = next_node
    @prev = prev_node
  end
end

# Time complexity: Get and put O(1)
# Space complexity: O(n)
class LRUCache
  def initialize(capacity)
    @cache = {}
    @capacity = capacity
    @lru = ListNode.new
    @mru = ListNode.new

    @lru.next = @mru
    @mru.prev = @lru
  end

  def get(key)
    if @cache[key]
      node = @cache[key]
      remove(node)
      insert(node)
      return node.val
    end

    -1
  end

  def put(key, value)
    if @cache[key]
      node = @cache[key]
      remove(node)
      node.val = value
      insert(node)
    else
      node = ListNode.new(key, value)
      insert(node)
      @cache[key] = node
    end

    if @cache.length > @capacity
      lru_node = @lru.next
      @cache.delete(lru_node.key)
      remove(lru_node)
    end
  end

  private

  def remove(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def insert(node)
    node.prev = @mru.prev
    node.next = @mru
    @mru.prev.next = node
    @mru.prev = node
  end
end
