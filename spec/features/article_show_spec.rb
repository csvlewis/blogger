require "rails_helper"

describe "article show page" do
  describe "when a visitor visits an article's title on the index page" do
    it "that article's information is displayed" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
