class DatepickerInput < SimpleForm::Inputs::StringInput
  def initialize(builder, attribute_name, column, _input_type, options = {})
    super(builder, attribute_name, column, :text, options)
  end

  def input(_wrapper_options)
    template.content_tag(:div, super)
  end
end
