ActiveAdmin.register Song do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :durability
      f.input :artist, prompt: true
      f.input :album, prompt: true
    end
    f.inputs "Genres" do
      f.input :genres, as: :check_boxes
    end
    f.buttons
  end
end
