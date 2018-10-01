module BadgesHelper
  def badge_header(badge)
    badge.persisted? ? "Edit '#{badge.title}' badge" :
                       "Create #{badge.title} badge"

  end
end
