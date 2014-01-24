FactoryGirl.define do

  factory :row do
    title       'Row title'
    description 'Row description'
    link_url    'http://www.foo.com'
  end

  factory :thumb do |thumb|
    label       'Thumb label'
    image_path  'http://www.foo.com'
    active      true
    thumb.association :row
  end

end
