  class SimpleDSL
    class << self
      def values(*names)
        names.each do |name|
          define_method(name) do
            "#{name}".to_sym
          end
        end
      end

      def fields(*names)
        names.each do |name|
          define_method(name) do |val|
            instance_variable_set "@#{name}".to_sym, val
          end
        end
      end

      def groups(*names)
        names.each do |name|
          define_method(name) do |*vals|
            instance_variable_set "@#{name}".to_sym, vals
          end
        end
      end

      def custom(*names, &block)
        names.each do |name|
          define_method(name, &block)
        end
      end
    end
  end
