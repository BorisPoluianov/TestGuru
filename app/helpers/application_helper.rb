module ApplicationHelper
  FLASH_TYPES = {
    notice: "alert alert-info",
    alert: "alert alert-danger"
  }.freeze


  def flash_class(type)
    FLASH_TYPES[type]
  end
end
