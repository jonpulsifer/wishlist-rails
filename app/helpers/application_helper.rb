module ApplicationHelper
    def bootstrap_class_for flash_type
        { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
    end
    
    def flash_messages(opts = {})
      flash.each do |msg_type, message|
        content_tag(:span, message, class: "mdl-chip #{bootstrap_class_for(msg_type)}", role: "wat")
      end
      
      nil
    end
end
