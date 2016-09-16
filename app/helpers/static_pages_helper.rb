module StaticPagesHelper
  def active_link(page)
    if current_page?(page)
      return 'active'
    end
  end
end
