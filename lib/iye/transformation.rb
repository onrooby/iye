module Iye
  class TransformationError < StandardError; end

  module Transformation
    def flatten_hash hash, namespace=[], tree={}
      hash.each {|key, value|
        child_ns = namespace.dup << key
        if value.is_a?(Hash)
          flatten_hash value, child_ns, tree
        else
          tree[child_ns.join(".")] = value
        end
      }
      tree
    end
    module_function :flatten_hash

    def nest_hash(flat_hash)
      nested = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
      flat_hash.each do |key, value|
        keys = key.split('.')
        leaf = keys[0..-2].inject(nested) { |h, k| h[k] }
        raise TransformationError.new("Failed to nest key: #{key.inspect} with value: #{value.inspect}") if leaf.is_a?(String)
        leaf[keys.last] = value
      end
      nested
    end
    module_function :nest_hash
  end
end
