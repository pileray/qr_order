class OrderUnit < ApplicationRecord
  has_one :order, dependent: :restrict_with_error
  validates :code, presence: true, uniqueness: true

  def qrcode
    qrcode = RQRCode::QRCode.new(Rails.application.routes.url_helpers.order_unit_url(self))
    svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 4,
      standalone: true,
      use_path: true
    ).html_safe
  end

  def to_param
    code
  end
end
