require 'i18n/active_record'

module I18n
  module Backend
    class ActiveRecord
      module Scoped
        def lookup(locale, key, scope = [], options = {})
          key = normalize_flat_keys(locale, key, scope, options[:separator])
          result = scoped_translations(options[:translations]).locale(locale).lookup(key)

          if result.empty?
            nil
          elsif result.first.key == key
            result.first.value
          else
            chop_range = (key.size + FLATTEN_SEPARATOR.size)..-1
            result = result.inject({}) do |hash, r|
              hash[r.key.slice(chop_range)] = r.value
              hash
            end
            result.deep_symbolize_keys
          end
        end

        def scoped_translations(scope)
          scope || Translation
        end
      end

      include Scoped
    end
  end
end
