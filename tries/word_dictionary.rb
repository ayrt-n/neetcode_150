# frozen_string_literal: true

# Implementation of TrieNode
class TrieNode
  attr_accessor :word, :edges

  def initialize
    @word = false
    @edges = {}
  end
end

# Implementation of Word Dictionary
class WordDictionary
  def initialize
    @root = TrieNode.new
  end

  def add_word(word)
    curr = @root
    word.each_char do |c|
      curr.edges[c] = TrieNode.new if curr.edges[c].nil?
      curr = curr.edges[c]
    end
    curr.word = true
  end

  def search(word, start = 0, node = @root)
    (start...word.length).each do |i|
      c = word[i]
      if c == '.'
        node.edges.each_value do |child|
          return true if search(word, i + 1, child)
        end
        return false
      else
        return false if node.edges[c].nil?

        node = node.edges[c]
      end
    end
    node.word
  end
end
