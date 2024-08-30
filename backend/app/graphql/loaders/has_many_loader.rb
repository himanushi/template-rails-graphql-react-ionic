# frozen_string_literal: true

module Loaders
  class HasManyLoader
    def self.load(model, association_name, current_object, options)
      if query_root?(current_object)
        records = ScopeBuilder.new(model, options).exec
        records = records.distinct if options[:distinct]
        records = records.joins(options[:joins]) if options[:joins]
        records = records.includes(options[:includes]) if options[:includes]
        records = records.preload(options[:preload]) if options[:preload]
        records = records.offset(options[:cursor][:offset]) if options[:cursor] && options[:cursor][:offset]
        records = records.first(options[:cursor][:limit]) if options[:cursor] && options[:cursor][:limit]
        records
      else
        Loaders::AssociationLoader
          .for(current_object.class, association_name, options.except(:cursor))
          .load(current_object)
          .then do |records|
            ans = records || []
            ans = ans.slice(options[:cursor][:offset]..) || [] if options[:cursor] && options[:cursor][:offset]
            ans = ans.first(options[:cursor][:limit]) || [] if options[:cursor] && options[:cursor][:limit]
            ans || []
          end
      end
    end

    def self.query_root?(current_object)
      current_object.nil?
    end
  end
end
