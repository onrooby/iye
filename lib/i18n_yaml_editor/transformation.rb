# encoding: utf-8

module I18nYamlEditor
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

    def nest_hash hash
      result = {}
      hash.each {|key, value|
        sub_result = result
        keys = key.split(".")
        keys.each_with_index {|k, idx|
          if keys.size - 1 == idx
            sub_result[k.to_sym] = value
          else
            sub_result = (sub_result[k.to_sym] ||= {})
          end
        }
      }
      result
    end
    module_function :nest_hash
  end
end
