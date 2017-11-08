module ApplicationHelper

	ActionView::Helpers::FormBuilder.class_eval do
        def text_field_b(method, options = {})
	    	text_field(method, options.merge(class: 'form-control'))
        end
        def text_field_datepicker(method, options = {})
	    	text_field(method, options.merge(class: 'datepicker form-control'))
        end
    end
end
