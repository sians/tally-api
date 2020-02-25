class BaseSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  # def is_first_level?
  #   !self.instance_options[:serializer_context_class]
  # end

  # def method_missing(method_sym, *arguments, &block)
  #   if method_sym.to_s =~ /^include_(.*)\?$/
  #     associations_to_include = instance_options[:include_params]
  #     return associations_to_include &&
  #         associations_to_include.kind_of?(Array) &&
  #         associations_to_include.map(&:to_s).include?($1)
  #   else
  #     super
  #   end
  # end

  # def should_render_association(association)
  #   include_params = self.instance_options[:include_params] || ''
  #   include_params.include?(association)
  # end
end
