module ApplicationHelper
  def page_footer(file)
    file = file.delete_prefix(Rails.root.to_s)

    # Heroku includes "/app" in Rails.root and removes it. This adds it back
    #   if missing so the locations are accurate.
    file = "/app" + file unless file.start_with?("/app")

    render 'shared/page_footer', locals: { file: file }
  end

  def flash
    render 'shared/flash'
  end
end
