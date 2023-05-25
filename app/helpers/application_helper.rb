module ApplicationHelper
  def page_footer(file)
    render 'shared/page_footer', locals: { file: file }
  end

  def flash
    render 'shared/flash'
  end

end
