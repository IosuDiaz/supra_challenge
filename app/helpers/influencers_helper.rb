module InfluencersHelper
  # Retorna el image_tag con el logo de la plataforma
  def platform_logo(platform)
    logo_filename = case platform.downcase
                    when "instagram"
                      "instagram_logo.png"
                    when "tiktok"
                      "tiktok_logo.png"
                    when "youtube"
                      "youtube_logo.png"
                    else
                      nil
                    end

    # Si no se encontró un logo, se puede retornar nil o un logo por defecto
    if logo_filename
      image_tag(logo_filename, alt: platform.capitalize, class: "w-5 h-5 inline-block")
    else
      # O retorna un span con el nombre de la plataforma
      content_tag(:span, platform.capitalize, class: "text-gray-500")
    end
  end
end