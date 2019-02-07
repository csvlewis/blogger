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

    describe "and they click Delete Article" do
      it "displays all articles without the deleted entry" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit article_path(article_1)
        click_link "Delete"

        expect(current_path).to eq(articles_path)
        expect(page).to have_content(article_2.title)
        expect(page).to_not have_content(article_1.title)
      end
    end
  end
end
