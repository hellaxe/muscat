ActiveAdmin.register Artist do
  index do
    column :name
    column :description
    column :photo do |artist|
      image_tag artist.photo.url :thumb
    end
    default_actions
  end

  show do |artist|
    attributes_table do
      row :name
      row :description
      row :photo do
        image_tag artist.photo.url :thumb
      end
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
    end
    f.inputs "Photo" do
      f.input :photo, as: :file
    end
    f.inputs "Genres" do
      f.input :genres, as: :check_boxes
    end
    f.buttons
  end
end
