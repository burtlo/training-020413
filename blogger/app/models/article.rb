class Article < ActiveRecord::Base
  attr_accessible :title, :body, :image, :tag_list

  validates :title, :body, presence: true

  has_many :comments
  has_attached_file :image, styles: {
    thumbnail: "100x100>",
    medium: "300x300>" }

  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags.map { |tag| tag.name }.join(", ")
  end

  def tag_list=(value)
    tag_names = split_and_clean_tag_strings(value)

    tag_names.each do |tag_name|
      unless tags.find { |tag| tag.name == tag_name }
        tags << Tag.find_or_create_by_name(tag_name)
      end
    end

  end

  private

  def split_and_clean_tag_strings(value)
    value.to_s.split(",").map {|tag_name| tag_name.strip }.uniq
  end

end
