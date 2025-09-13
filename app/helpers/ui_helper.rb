module UiHelper
  # GET向け（a要素）
  #
  # ui_link_button "作成", new_collection_setting_path, variant: :primary, size: :md, turbo_frame: "modal", class: "w-full"
  def ui_link_button(label, url, variant: :primary, size: :sm, turbo_frame: nil, **opts, &block)
    classes = build_btn_classes(variant, size, opts.delete(:class))
    opts[:class] = classes
    opts[:"data-turbo-frame"] = turbo_frame if turbo_frame.present?
    link_to(label, url, **opts, &block)
  end

  # 非GET向け（form+button。DELETE/POST/PATCHなど）
  #
  # ui_button_to "削除", specimen_path(@specimen), method: :delete, variant: :danger, size: :sm
  def ui_button_to(label, url, method: :post, variant: :primary, size: :sm, turbo_frame: nil, **opts, &block)
    classes = build_btn_classes(variant, size, opts.delete(:class))
    button_opts = { class: classes }
    button_opts[:form] = (opts.delete(:form) || {})
    button_opts[:form][:data] = (button_opts[:form][:data] || {})
    button_opts[:form][:data][:turbo_frame] = turbo_frame if turbo_frame.present?

    button_to(label, url, { method: method }.merge(button_opts).merge(opts), &block)
  end

  private

  def build_btn_classes(variant, size, extra)
    base = "btn"
    variants = {
      primary:   "btn-primary",
      secondary: "btn-secondary",
      danger:    "btn-danger"
    }
    sizes = {
      sm: "btn-sm",
      md: "btn-md",
      lg: "btn-lg"
    }
    [ base, variants.fetch(variant, variants[:primary]), sizes.fetch(size, sizes[:md]), extra ].compact.join(" ")
  end
end
