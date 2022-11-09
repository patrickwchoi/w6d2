class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method("#{name}=".to_sym) do |new_val|
        instance_variable_set("@#{name}", new_val)
      end 
    end

    names.each do |name|
      define_method("#{name}".to_sym) do
        instance_variable_get("@#{name}")
      end 
    end
  end

  
end
