module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts.unshift "Yumm").join(" - ")
      end
    end
  end

  def managers_only(&blk)
    blk.call if current_employee.try(:manager?)
  end

end
