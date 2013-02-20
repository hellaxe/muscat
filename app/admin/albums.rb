ActiveAdmin.register Album do
  index do
    column :artist
    column :name
    column "Cover" do |album|
      image_tag album.cover.url(:small)
    end
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :artist
    end
    f.inputs "Cover" do
      f.input :cover, as: :file
    end
    f.buttons
  end

  show do |album|
    attributes_table do
      row :cover do
        image_tag album.cover.url(:small)
      end
      row :artist
      row :name
    end
  end
end
