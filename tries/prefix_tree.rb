# frozen_string_literal: true

# Implementation of TrieNode
class TrieNode
  attr_accessor :word, :edges
  
  def initialize
    @word = false
    @edges = {}
  end
end

# Implementation of Trie
# Time complexity: Insert/Search/Prefix O(n)
# Space complexity: O(n) 
class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    curr = @root
    word.each_char do |c|
      curr.edges[c] = TrieNode.new if curr.edges[c].nil?
      curr = curr.edges[c]
    end
    curr.word = true
  end

  def search(word)
    curr = @root
    word.each_char do |c|
      return false if curr.edges[c].nil?

      curr = curr.edges[c]
    end
    curr.word
  end

  def starts_with(prefix)
    curr = @root
    prefix.each_char do |c|
      return false if curr.edges[c].nil?

      curr = curr.edges[c]
    end

    true
  end
end
