class AttrAccessorObject
  def self.my_attr_accessor(*names)

    #   To do this, use define_method inside ::my_attr_accessor to define getter and setter instance methods.
    #   You'll want to investigate and use the instance_variable_get and instance_variable_set methods described here.
    #   t_spec.rb spec file. Run it using bundle exec rspec to check your work.
    names.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end


  end

end
