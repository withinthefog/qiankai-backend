class Footer < ActiveAdmin::Component
  def build
    super(id: 'footer')
    para "Copyright © #{Date.today.year} Qiankai"
  end
end
