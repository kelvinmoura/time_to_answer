module AdminsBackofficeHelper
    def translate_attribute(object = nil, method = nil)
        if object and method
            object.model.human_attribute_name(method)
        else
            "informe os parâmetros corretamente!"
        end
    end
    
end
